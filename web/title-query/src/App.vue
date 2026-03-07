<script setup>
import { computed, onMounted, ref } from 'vue';

const query = ref('');
const loading = ref(true);
const error = ref('');
const players = ref([]);
const titles = ref([]);
const mapTitles = ref([]);
const meta = ref(null);
const hasQuery = computed(() => query.value.trim().length > 0);
const MAP_TITLE_LABELS = {
  PIONEER: '开拓者',
  CONQUEROR: '征服者',
  DOMINATOR: '主宰'
};

const filteredPlayers = computed(() => {
  const keyword = query.value.trim().toLocaleLowerCase();
  const sortedPlayers = [...players.value].sort((left, right) => {
    if (right.titleCount !== left.titleCount) {
      return right.titleCount - left.titleCount;
    }

    return left.name.localeCompare(right.name, 'zh-Hans-CN');
  });

  if (!keyword) {
    return [];
  }

  return sortedPlayers.filter((player) => player.name.toLocaleLowerCase().includes(keyword));
});

const exactMatch = computed(() => {
  const keyword = query.value.trim();
  if (!keyword) {
    return null;
  }

  return players.value.find((player) => player.name === keyword) || null;
});

const showcasedPlayer = computed(() => {
  if (!hasQuery.value) {
    return null;
  }

  return exactMatch.value || filteredPlayers.value[0] || null;
});
const visibleTitles = computed(() => titles.value.filter((title) => title.id > 10));
function groupTitlesBySeries(titleList) {
  const seriesMap = new Map();

  for (const title of titleList) {
    const series = String(title?.category || '').trim() || '未分类';
    const bucket = seriesMap.get(series);

    if (bucket) {
      bucket.push(title);
    } else {
      seriesMap.set(series, [title]);
    }
  }

  return [...seriesMap.entries()]
    .map(([series, seriesTitles]) => ({
      series,
      titles: [...seriesTitles].sort((left, right) => left.id - right.id)
    }))
    .sort((left, right) => {
      if (right.titles.length !== left.titles.length) {
        return right.titles.length - left.titles.length;
      }

      return left.series.localeCompare(right.series, 'zh-Hans-CN');
    });
}

const groupedTitles = computed(() => {
  const player = showcasedPlayer.value;
  const ownedIds = new Set(player?.titleIds ?? []);
  const owned = [];
  const missing = [];

  for (const title of visibleTitles.value) {
    if (ownedIds.has(title.id)) {
      owned.push(title);
    } else {
      missing.push(title);
    }
  }

  return {
    ownedSeries: groupTitlesBySeries(owned),
    missingSeries: groupTitlesBySeries(missing),
    ownedCount: owned.length,
    missingCount: missing.length
  };
});

const groupedMapTitles = computed(() => {
  const player = showcasedPlayer.value;
  const maps = mapTitles.value ?? [];
  const mapTitleOrder = ['PIONEER', 'CONQUEROR', 'DOMINATOR'];

  return maps.map((mapItem) => {
    const status = player?.mapTitleStatus?.[mapItem.mapKey] ?? {};
    const orderedSlots = mapTitleOrder
      .map((slotKey, index) => ({
        key: slotKey,
        label: MAP_TITLE_LABELS[slotKey],
        owned: Boolean(status[slotKey]),
        order: index
      }))
      .sort((left, right) => {
        if (left.owned !== right.owned) {
          return Number(left.owned) - Number(right.owned);
        }
        return left.order - right.order;
      });

    return {
      ...mapItem,
      orderedSlots
    };
  });
});

const sourceDisplay = computed(() => {
  if (!meta.value) {
    return '躲避堡垒3';
  }

  const sourceLabel = meta.value.sourceLabel || '躲避堡垒3';
  return meta.value.sourceVersion ? `${sourceLabel} ${meta.value.sourceVersion}` : sourceLabel;
});

function isRetiredTitle(title) {
  if (title?.availability === 'retired') {
    return true;
  }

  const conditionText = String(title?.condition || '');
  return /不再发放|历史称号/.test(conditionText);
}

async function loadData() {
  loading.value = true;
  error.value = '';

  try {
    const response = await fetch('./data/titles.json', { cache: 'no-store' });
    if (!response.ok) {
      throw new Error(`数据请求失败（${response.status}）`);
    }

    const payload = await response.json();
    players.value = payload.players ?? [];
    titles.value = payload.titles ?? [];
    mapTitles.value = payload.mapTitles ?? [];
    meta.value = payload.meta ?? null;
  } catch (loadError) {
    error.value = loadError instanceof Error ? loadError.message : '称号数据加载失败';
  } finally {
    loading.value = false;
  }
}

onMounted(() => {
  loadData();
});
</script>

<template>
  <div class="page-shell">
    <div class="ambient ambient-left"></div>
    <div class="ambient ambient-right"></div>

    <main class="page-frame">
      <section class="hero-panel">
        <p class="eyebrow">Bastion Title Query</p>
        <h1>玩家称号查询</h1>
        <p class="hero-copy">
          输入玩家名后可直接看到“已获取 / 未获取”的完整称号进度情况。
        </p>

        <label class="search-panel">
          <span>搜索玩家</span>
          <input
            v-model="query"
            type="search"
            placeholder="输入完整昵称或关键字，例如 卖核弹 / Cold / 旅店"
            autocomplete="off"
          />
        </label>
        <div class="search-candidates" v-if="hasQuery && !loading && !error && filteredPlayers.length">
          <button
            v-for="player in filteredPlayers"
            :key="`candidate-${player.name}`"
            class="candidate-chip"
            type="button"
            @click="query = player.name"
          >
            <span class="candidate-name">{{ player.name }}</span>
            <span class="candidate-count">{{ player.titleCount }}</span>
          </button>
        </div>
        <p class="search-candidates-empty" v-else-if="hasQuery && !loading && !error">
          没有匹配到玩家，请尝试更短关键字或完整昵称。
        </p>

        <div class="hero-stats" v-if="meta">
          <article>
            <strong>{{ meta.titleCount }}</strong>
            <span>称号定义</span>
          </article>
          <article>
            <strong>{{ filteredPlayers.length }}</strong>
            <span>{{ hasQuery ? '搜索候选' : '搜索候选（待输入）' }}</span>
          </article>
        </div>
      </section>

      <section class="content-grid">
        <article class="card spotlight-card">
          <header class="card-header">
            <p>查询结果</p>
            <h2>玩家详情</h2>
          </header>

          <div v-if="loading" class="state-block">正在加载称号数据…</div>
          <div v-else-if="error" class="state-block state-error">{{ error }}</div>
          <div v-else-if="!hasQuery" class="spotlight-body">
            <div class="player-heading">
              <div>
                <p class="player-name">未选择玩家</p>
                <p class="player-meta">请输入玩家昵称后查看个人称号与解锁条件</p>
              </div>
              <div class="player-badge">SEARCH FIRST</div>
            </div>
          </div>
          <div v-else-if="!showcasedPlayer" class="state-block">
            没有找到匹配的玩家，试试缩短关键字或直接输入完整昵称。
          </div>
          <div v-else class="spotlight-body">
            <div class="player-heading">
              <div>
                <p class="player-name">{{ showcasedPlayer.name }}</p>
                <p class="player-meta">
                  已获取 {{ groupedTitles.ownedCount }} / {{ visibleTitles.length }}
                </p>
              </div>
              <div class="player-badge">TITLE STATUS</div>
            </div>
          </div>
        </article>
      </section>

      <section class="catalog-panel card" v-if="hasQuery">
        <header class="card-header">
          <p>所有称号列表</p>
          <h2>已获取 / 未获取</h2>
        </header>

        <div v-if="loading" class="state-block">正在生成称号进度…</div>
        <div v-else-if="error" class="state-block state-error">当前无法显示称号进度。</div>
        <div v-else class="title-groups">
          <article class="title-group title-group-owned">
            <h3>已获取（{{ groupedTitles.ownedCount }}）</h3>
            <div class="series-list" v-if="groupedTitles.ownedSeries.length">
              <article
                class="series-card"
                v-for="seriesGroup in groupedTitles.ownedSeries"
                :key="`owned-series-${seriesGroup.series}`"
              >
                <header class="series-head">
                  <p class="series-name">{{ seriesGroup.series }}</p>
                  <span class="series-count">{{ seriesGroup.titles.length }}</span>
                </header>
                <ul class="status-title-list series-title-list">
                  <li v-for="title in seriesGroup.titles" :key="`owned-${title.id}`">
                    <span class="title-chip title-chip-owned">
                      <span class="title-head">
                        <span class="title-label">{{ title.label }}</span>
                        <span class="title-tag">{{ title.category }}</span>
                        <span class="title-tag title-tag-retired" v-if="isRetiredTitle(title)">不再发放</span>
                      </span>
                      <span class="title-condition">{{ title.condition }}</span>
                    </span>
                  </li>
                </ul>
              </article>
            </div>
            <p v-else class="group-empty">当前玩家暂无已获取称号。</p>
          </article>

          <article class="title-group title-group-missing">
            <h3>未获取（{{ groupedTitles.missingCount }}）</h3>
            <div class="series-list" v-if="groupedTitles.missingSeries.length">
              <article
                class="series-card"
                v-for="seriesGroup in groupedTitles.missingSeries"
                :key="`missing-series-${seriesGroup.series}`"
              >
                <header class="series-head">
                  <p class="series-name">{{ seriesGroup.series }}</p>
                  <span class="series-count">{{ seriesGroup.titles.length }}</span>
                </header>
                <ul class="status-title-list series-title-list">
                  <li v-for="title in seriesGroup.titles" :key="`missing-${title.id}`">
                    <span class="title-chip title-chip-missing">
                      <span class="title-head">
                        <span class="title-label">{{ title.label }}</span>
                        <span class="title-tag">{{ title.category }}</span>
                        <span class="title-tag title-tag-retired" v-if="isRetiredTitle(title)">不再发放</span>
                      </span>
                      <span class="title-condition">{{ title.condition }}</span>
                    </span>
                  </li>
                </ul>
              </article>
            </div>
            <p v-else class="group-empty">当前玩家已获取全部称号。</p>
          </article>
        </div>
      </section>

      <section class="catalog-panel card" v-if="hasQuery">
        <header class="card-header">
          <p>地图专属称号</p>
          <h2>开拓者 / 征服者 / 主宰（未获得优先）</h2>
        </header>

        <div v-if="loading" class="state-block">正在生成地图称号进度…</div>
        <div v-else-if="error" class="state-block state-error">当前无法显示地图称号进度。</div>
        <div v-else-if="!showcasedPlayer" class="state-block">请选择玩家后查看地图专属称号。</div>
        <div v-else class="map-title-grid">
          <article class="map-title-card" v-for="mapItem in groupedMapTitles" :key="mapItem.mapKey">
            <p class="map-title-name">{{ mapItem.mapLabel }}</p>
            <ul class="status-title-list">
              <li v-for="slot in mapItem.orderedSlots" :key="`${mapItem.mapKey}-${slot.key}`">
                <span class="title-chip" :class="slot.owned ? 'title-chip-owned' : 'title-chip-missing'">
                  <span class="title-head">
                    <span class="title-label">{{ slot.label }}</span>
                    <span class="title-tag" :class="slot.owned ? 'map-status-owned' : 'map-status-missing'">
                      {{ slot.owned ? '已获得' : '未获得' }}
                    </span>
                  </span>
                </span>
              </li>
            </ul>
          </article>
        </div>
      </section>

      <footer class="page-footer" v-if="meta">
        <span>数据来源：{{ sourceDisplay }}</span>
        <span>生成时间：{{ new Date(meta.generatedAt).toLocaleString('zh-CN') }}</span>
      </footer>
    </main>
  </div>
</template>
