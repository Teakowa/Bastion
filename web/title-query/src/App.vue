<script setup>
import { computed, onMounted, ref } from 'vue';

const query = ref('');
const loading = ref(true);
const error = ref('');
const players = ref([]);
const titles = ref([]);
const meta = ref(null);

const filteredPlayers = computed(() => {
  const keyword = query.value.trim().toLocaleLowerCase();
  const rankedPlayers = [...players.value].sort((left, right) => {
    if (right.titleCount !== left.titleCount) {
      return right.titleCount - left.titleCount;
    }

    return left.name.localeCompare(right.name, 'zh-Hans-CN');
  });

  if (!keyword) {
    return rankedPlayers.slice(0, 12);
  }

  return rankedPlayers.filter((player) => player.name.toLocaleLowerCase().includes(keyword));
});

const exactMatch = computed(() => {
  const keyword = query.value.trim();
  if (!keyword) {
    return null;
  }

  return players.value.find((player) => player.name === keyword) || null;
});

const showcasedPlayer = computed(() => exactMatch.value || filteredPlayers.value[0] || null);

const groupedTitles = computed(() => {
  const player = showcasedPlayer.value;
  if (!player) {
    return {
      owned: [],
      missing: [...titles.value]
    };
  }

  const ownedIds = new Set(player.titleIds);
  const owned = [];
  const missing = [];

  for (const title of titles.value) {
    if (ownedIds.has(title.id)) {
      owned.push(title);
    } else {
      missing.push(title);
    }
  }

  return {
    owned,
    missing
  };
});

const sourceDisplay = computed(() => {
  if (!meta.value) {
    return '';
  }

  if (meta.value.sourceLabel && meta.value.sourceVersion) {
    return `${meta.value.sourceLabel} ${meta.value.sourceVersion}`;
  }

  return meta.value.sourceFile || '-';
});

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
          从
          <code>src/title/title-cn.opy</code>
          自动生成数据，输入玩家名后可直接看到“已获取 / 未获取”的完整称号对照。
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

        <div class="hero-stats" v-if="meta">
          <article>
            <strong>{{ meta.titleCount }}</strong>
            <span>称号定义</span>
          </article>
          <article>
            <strong>{{ query.trim() ? filteredPlayers.length : 12 }}</strong>
            <span>{{ query.trim() ? '匹配结果' : '默认展示' }}</span>
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
          <div v-else-if="!showcasedPlayer" class="state-block">
            没有找到匹配的玩家，试试缩短关键字或直接输入完整昵称。
          </div>
          <div v-else class="spotlight-body">
            <div class="player-heading">
              <div>
                <p class="player-name">{{ showcasedPlayer.name }}</p>
                <p class="player-meta">
                  已获取 {{ groupedTitles.owned.length }} / {{ titles.length }}
                </p>
              </div>
              <div class="player-badge">TITLE STATUS</div>
            </div>
          </div>
        </article>

        <article class="card list-card">
          <header class="card-header">
            <p>玩家列表</p>
            <h2>{{ query.trim() ? '匹配候选' : '称号数量前列' }}</h2>
          </header>

          <div v-if="loading" class="state-block">列表准备中…</div>
          <div v-else-if="error" class="state-block state-error">当前无法显示玩家列表。</div>
          <ul v-else class="player-list">
            <li v-for="player in filteredPlayers" :key="player.name">
              <button class="player-row" type="button" @click="query = player.name">
                <span class="player-row-name">{{ player.name }}</span>
                <span class="player-row-count">{{ player.titleCount }} 个称号</span>
              </button>
            </li>
          </ul>
        </article>
      </section>

      <section class="catalog-panel card">
        <header class="card-header">
          <p>所有称号列表</p>
          <h2>已获取 / 未获取 对照</h2>
        </header>

        <div v-if="loading" class="state-block">正在生成称号对照…</div>
        <div v-else-if="error" class="state-block state-error">当前无法显示称号对照。</div>
        <div v-else class="title-groups">
          <article class="title-group title-group-owned">
            <h3>已获取（{{ groupedTitles.owned.length }}）</h3>
            <ul class="status-title-list" v-if="groupedTitles.owned.length">
              <li v-for="title in groupedTitles.owned" :key="`owned-${title.id}`">
                <span class="title-chip title-chip-owned">{{ title.label }}</span>
              </li>
            </ul>
            <p v-else class="group-empty">当前玩家暂无已获取称号。</p>
          </article>

          <article class="title-group title-group-missing">
            <h3>未获取（{{ groupedTitles.missing.length }}）</h3>
            <ul class="status-title-list" v-if="groupedTitles.missing.length">
              <li v-for="title in groupedTitles.missing" :key="`missing-${title.id}`">
                <span class="title-chip title-chip-missing">{{ title.label }}</span>
              </li>
            </ul>
            <p v-else class="group-empty">当前玩家已获取全部称号。</p>
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
