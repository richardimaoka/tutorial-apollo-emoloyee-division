#!/bin/sh

cd "$(dirname "$0")" || exit 
cd ../ || exit # cd to the git repository root

find steps/* -print0 | \
  xargs -0 cat | \
  grep -v '#!/bin/sh' | \
  sed 's/^\#\s//' > README.md
