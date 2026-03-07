import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { parseTitleSource } from './generate-title-query-data.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const sourceFile = path.resolve(__dirname, '../src/title/title-cn.opy');

async function loadData() {
  const source = await fs.readFile(sourceFile, 'utf8');
  return parseTitleSource(source);
}

test('parses current title dataset shape', async () => {
  const data = await loadData();

  assert.equal(data.meta.titleCount, 49);
  assert.equal(data.meta.playerCount, 40);
});

test('extracts labels from allTitle with dynamic fallback handling', async () => {
  const data = await loadData();

  assert.deepEqual(
    data.titles.slice(0, 3),
    [
      { id: 0, key: 'PIONEER', label: '开拓者' },
      { id: 1, key: 'TEST_LONG', label: '这是一个超长的称号测试字段如果到这里还没有被截断说明确实很长你说得对但是广告位招租啊哈大OW是我的家乡' },
      { id: 2, key: 'NOT_MY_MAP', label: '地图不是我做的' }
    ]
  );
});

test('maps representative players to the expected title ids', async () => {
  const data = await loadData();
  const byName = new Map(data.players.map((player) => [player.name, player]));

  assert.deepEqual(byName.get('草艮'), {
    name: '草艮',
    titleIds: [12, 13],
    titleCount: 2
  });

  assert.deepEqual(byName.get('卖核弹的小女孩'), {
    name: '卖核弹的小女孩',
    titleIds: [19, 16, 12, 13, 22, 27, 28, 29, 33, 37, 43, 36, 44, 45, 47],
    titleCount: 15
  });
});
