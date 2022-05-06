#!/bin/sh

cd "$(dirname "$0")" || exit 
cd ../ || exit # cd to the git repository root

find steps/* -print0 | \
  xargs -0 cat | \
  grep -v '#!/bin/sh' | \
  grep -v '# REMOVE THIS' | \
  sed 's/^\#\s//' > README.md

# copy README.md to the clipboard
if which clip.exe 1>/dev/null # WSL
then
  clip.exe < README.md
elif which pbcopy  1>/dev/null # Mac
then
  pbcopy < README.md
elif which xsel  1>/dev/null # Debian/Ubuntu Linux
then
  # WSL gives error on xsel as "xsel: Can't open display: (null)" so, using clip.exe on WSL
  xsel --clipboard --input < README.md
fi