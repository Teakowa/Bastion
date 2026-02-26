#!/usr/bin/env node

const fs = require('node:fs');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

function getArg(name) {
  const idx = process.argv.indexOf(name);
  if (idx === -1 || idx + 1 >= process.argv.length) return '';
  return process.argv[idx + 1];
}

const input = getArg('--input');
const output = getArg('--output');

if (!input || !output) {
  console.error('Usage: node scripts/compile.js --input <src/main.opy> --output <build/main.ow>');
  process.exit(1);
}

if (!fs.existsSync(input)) {
  console.error(`Input file does not exist: ${input}`);
  process.exit(1);
}

const outputDir = path.dirname(output);
fs.mkdirSync(outputDir, { recursive: true });

const localOverpy = path.resolve('node_modules', '.bin', process.platform === 'win32' ? 'overpy.cmd' : 'overpy');
const cliCommand = fs.existsSync(localOverpy) ? localOverpy : 'overpy';

const argVariants = [
  [input, '--output', output],
  [input, '-o', output],
  ['compile', input, '--output', output],
  ['compile', input, '-o', output],
  ['--input', input, '--output', output]
];

let lastError = null;

for (const args of argVariants) {
  const result = spawnSync(cliCommand, args, { stdio: 'inherit' });
  if (result.status === 0) {
    process.exit(0);
  }

  if (result.error) {
    lastError = result.error;
  }
}

if (lastError) {
  console.error('Failed to execute overpy CLI:', lastError.message);
} else {
  console.error('Failed to compile with all known overpy CLI argument formats.');
}

process.exit(1);
