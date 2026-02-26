#!/usr/bin/env node

const fs = require('node:fs');
const path = require('node:path');
const overpy = require('@zezombye/overpy');

function getArg(name) {
  const idx = process.argv.indexOf(name);
  if (idx === -1 || idx + 1 >= process.argv.length) return '';
  return process.argv[idx + 1];
}

const input = getArg('--input');
const output = getArg('--output');
const language = getArg('--language') || 'en-US';

if (!input || !output) {
  console.error('Usage: node scripts/compile.js --input <src/main.opy> --output <build/main.ow> [--language en-US]');
  process.exit(1);
}

const absInput = path.resolve(input);
const absOutput = path.resolve(output);

if (!fs.existsSync(absInput)) {
  console.error(`Input file does not exist: ${absInput}`);
  process.exit(1);
}

const outputDir = path.dirname(absOutput);
fs.mkdirSync(outputDir, { recursive: true });

async function main() {
  try {
    const content = fs.readFileSync(absInput, 'utf8');
    if (overpy.readyPromise) {
      await overpy.readyPromise;
    }

    const compileResult = await overpy.compile(
      content,
      language,
      `${path.dirname(absInput)}${path.sep}`,
      path.basename(absInput)
    );

    if (!compileResult || typeof compileResult.result !== 'string' || compileResult.result.length === 0) {
      throw new Error('OverPy compile returned empty result.');
    }

    fs.writeFileSync(absOutput, compileResult.result, 'utf8');
    console.log(`Compiled [${language}] ${absInput} -> ${absOutput}`);
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`Failed to compile [${language}] ${absInput}: ${message}`);
    process.exit(1);
  }
}

main();
