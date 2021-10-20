#!/usr/bin/env bash

set -o errexit

OUTDIR=docs/pages/

if [ ! -d node_modules ]; then
  npm ci
fi

rm -rf "$OUTDIR"

solidity-docgen \
  -o "$OUTDIR" \
  --solc-module solc

# node scripts/gen-nav.js "$OUTDIR" > "$OUTDIR/../nav.adoc"
