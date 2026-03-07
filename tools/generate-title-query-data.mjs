import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const SOURCE_FILE = path.resolve(__dirname, '../src/title/title-cn.opy');
const ENV_FILE = path.resolve(__dirname, '../src/env/env.opy');
const OUTPUT_FILE = path.resolve(__dirname, '../web/title-query/public/data/titles.json');

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function extractIndentedBlock(source, header) {
  const start = source.indexOf(header);
  if (start === -1) {
    throw new Error(`Unable to find block header: ${header}`);
  }

  const blockStart = start + header.length;
  const remainder = source.slice(blockStart);
  const lines = remainder.split('\n');
  const collected = [];

  for (const line of lines) {
    if (line.startsWith('    ') || line.trim() === '') {
      collected.push(line);
      continue;
    }

    break;
  }

  return collected.join('\n');
}

function extractBracketSection(source, header) {
  const start = source.indexOf(header);
  if (start === -1) {
    throw new Error(`Unable to find section header: ${header}`);
  }

  const openIndex = source.indexOf('[', start);
  if (openIndex === -1) {
    throw new Error(`Unable to find opening [ for section: ${header}`);
  }

  let depth = 0;
  let inString = false;
  let escaped = false;

  for (let index = openIndex; index < source.length; index += 1) {
    const char = source[index];

    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (char === '\\') {
        escaped = true;
      } else if (char === '"') {
        inString = false;
      }
      continue;
    }

    if (char === '"') {
      inString = true;
      continue;
    }

    if (char === '[') {
      depth += 1;
      continue;
    }

    if (char === ']') {
      depth -= 1;
      if (depth === 0) {
        return source.slice(openIndex, index + 1);
      }
    }
  }

  throw new Error(`Unable to find closing ] for section: ${header}`);
}

function splitTopLevelObjects(source) {
  const items = [];
  let current = '';
  let depth = 0;
  let inString = false;
  let escaped = false;

  for (const char of source) {
    current += char;

    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (char === '\\') {
        escaped = true;
      } else if (char === '"') {
        inString = false;
      }
      continue;
    }

    if (char === '"') {
      inString = true;
      continue;
    }

    if (char === '{') {
      depth += 1;
      continue;
    }

    if (char === '}') {
      depth -= 1;
      if (depth === 0) {
        items.push(current.trim());
        current = '';
      }
    }
  }

  return items.filter(Boolean);
}

function parseTitleEnum(source) {
  const block = extractIndentedBlock(source, 'enum TITLE:\n');
  const titles = [];

  for (const line of block.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed) {
      continue;
    }

    const match = trimmed.match(/^([A-Z0-9_]+)\s*,?(?:\s*#\s*\d+\s*(.*))?$/);
    if (!match) {
      throw new Error(`Unable to parse TITLE enum line: ${trimmed}`);
    }

    titles.push({
      id: titles.length,
      key: match[1],
      fallbackLabel: (match[2] || '').trim()
    });
  }

  if (titles.length === 0) {
    throw new Error('Parsed TITLE enum is empty.');
  }

  return titles;
}

function parseStaticTitleLabels(source, titleEnum) {
  const block = extractBracketSection(source, 'allTitle = [');
  const lines = block
    .split('\n')
    .map((line) => line.trim())
    .filter((line) => line.startsWith('[') && line !== '[');

  if (lines.length !== titleEnum.length) {
    throw new Error(
      `allTitle entry count (${lines.length}) does not match TITLE enum count (${titleEnum.length}).`
    );
  }

  return titleEnum.map((item, index) => {
    const line = lines[index];
    const match = line.match(/\[\s*"((?:[^"\\]|\\.)*)"/);

    if (!match) {
      throw new Error(`Unable to parse allTitle label line: ${line}`);
    }

    const rawLabel = match[1].replace(/\\"/g, '"');
    const cleaned = rawLabel.replace(/\{\d+\}/g, '').trim();
    const label = cleaned || item.fallbackLabel;

    if (!label) {
      throw new Error(`Unable to resolve label for TITLE.${item.key}`);
    }

    return {
      id: item.id,
      key: item.key,
      label
    };
  });
}

function parseSimpleArrayMacros(source) {
  const result = new Map();
  const regex = /^#!define\s+([A-Z0-9_]+)\s+\[(.*)\]$/gm;

  for (const match of source.matchAll(regex)) {
    result.set(match[1], match[2].trim());
  }

  return result;
}

function parseTitleListExpression(expression, titleIdByKey, arrayMacros, playerName) {
  const trimmed = expression.trim();
  let resolved = trimmed;

  if (arrayMacros.has(trimmed)) {
    resolved = `[${arrayMacros.get(trimmed)}]`;
  }

  if (!resolved.startsWith('[') || !resolved.endsWith(']')) {
    throw new Error(`Unsupported title expression for ${playerName}: ${expression}`);
  }

  const tokens = resolved
    .slice(1, -1)
    .split(',')
    .map((token) => token.trim())
    .filter(Boolean);

  const seen = new Set();
  const titleIds = [];

  for (const token of tokens) {
    const match = token.match(/^TITLE\.([A-Z0-9_]+)$/);
    if (!match) {
      throw new Error(`Unsupported title token for ${playerName}: ${token}`);
    }

    const titleKey = match[1];
    const titleId = titleIdByKey.get(titleKey);

    if (titleId === undefined) {
      throw new Error(`Unknown title token for ${playerName}: ${token}`);
    }

    if (seen.has(titleId)) {
      console.warn(`Deduplicated duplicate title ${titleKey} for player ${playerName}`);
      continue;
    }

    seen.add(titleId);
    titleIds.push(titleId);
  }

  return titleIds;
}

function parsePlayerDatabase(source, titleEnum) {
  const macros = parseSimpleArrayMacros(source);
  const titleIdByKey = new Map(titleEnum.map((title) => [title.key, title.id]));
  const block = extractBracketSection(source, '#!define player_database');
  const compact = block
    .replace(/\\\s*\n/g, ' ')
    .replace(/\\/g, ' ')
    .replace(/\s+/g, ' ');

  const objectMatches = splitTopLevelObjects(compact.slice(1, -1));
  const players = objectMatches.map((entry) => {
    const nameMatch = entry.match(/name:\s*"([^"]+)"/);
    const titlesMatch = entry.match(/titles:\s*(\[[^\]]*\]|[A-Z0-9_]+)/);

    if (!nameMatch || !titlesMatch) {
      throw new Error(`Unable to parse player entry: ${entry}`);
    }

    const name = nameMatch[1];
    const titleIds = parseTitleListExpression(titlesMatch[1], titleIdByKey, macros, name);

    return {
      name,
      titleIds,
      titleCount: titleIds.length
    };
  });

  if (players.length === 0) {
    throw new Error('Parsed player database is empty.');
  }

  return players;
}

function parseMainVersion(source) {
  const match = source.match(/^#!define\s+VERSION\s+"([^"]+)"/m);
  if (!match) {
    throw new Error('Unable to parse VERSION from src/env/env.opy');
  }

  return match[1];
}

export function parseTitleSource(source) {
  const titleEnum = parseTitleEnum(source);
  const titles = parseStaticTitleLabels(source, titleEnum);
  const players = parsePlayerDatabase(source, titleEnum).sort((left, right) =>
    left.name.localeCompare(right.name, 'zh-Hans-CN')
  );

  return {
    titles,
    players,
    meta: {
      sourceFile: 'src/title/title-cn.opy',
      generatedAt: new Date().toISOString(),
      titleCount: titles.length,
      playerCount: players.length
    }
  };
}

export async function generateTitleQueryData({
  sourceFile = SOURCE_FILE,
  envFile = ENV_FILE,
  outputFile = OUTPUT_FILE
} = {}) {
  const [source, envSource] = await Promise.all([fs.readFile(sourceFile, 'utf8'), fs.readFile(envFile, 'utf8')]);
  const data = parseTitleSource(source);
  const mainVersion = parseMainVersion(envSource);
  data.meta.sourceLabel = '躲避堡垒3';
  data.meta.sourceVersion = mainVersion;

  await fs.mkdir(path.dirname(outputFile), { recursive: true });
  await fs.writeFile(outputFile, `${JSON.stringify(data, null, 2)}\n`, 'utf8');

  return data;
}

const invokedPath = process.argv[1] ? path.resolve(process.argv[1]) : null;

if (invokedPath === __filename) {
  generateTitleQueryData()
    .then((data) => {
      console.log(
        `Generated ${data.meta.playerCount} players and ${data.meta.titleCount} titles at ${path.relative(process.cwd(), OUTPUT_FILE)}`
      );
    })
    .catch((error) => {
      console.error(error.message);
      process.exitCode = 1;
    });
}
