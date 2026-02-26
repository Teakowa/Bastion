#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const input = process.argv[2];
const output = process.argv[3];

if (!input || !output) {
  console.error('Usage: node scripts/compile.js <input.opy> <output.ow>');
  process.exit(1);
}

const absInput = path.resolve(input);
const absOutput = path.resolve(output);
const outputDir = path.dirname(absOutput);

if (!fs.existsSync(absInput)) {
  console.error(`Input file not found: ${absInput}`);
  process.exit(1);
}

fs.mkdirSync(outputDir, { recursive: true });

const commandAttempts = [
  ['npx', ['--yes', 'overpy', 'compile', absInput, '-o', absOutput]],
  ['npx', ['--yes', 'overpy', '--input', absInput, '--output', absOutput]],
  ['npx', ['--yes', 'overpy', '-i', absInput, '-o', absOutput]]
];

let lastError = null;

for (const [cmd, args] of commandAttempts) {
  const result = spawnSync(cmd, args, { stdio: 'inherit' });

  if (result.status === 0 && fs.existsSync(absOutput) && fs.statSync(absOutput).size > 0) {
    console.log(`Compiled ${input} -> ${output}`);
    process.exit(0);
  }

  lastError = new Error(`Command failed: ${cmd} ${args.join(' ')} (exit ${result.status})`);
}

console.error(`Failed to compile ${input}.`);
if (lastError) {
  console.error(lastError.message);
}
process.exit(1);
