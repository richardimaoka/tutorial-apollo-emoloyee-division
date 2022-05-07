#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches/1-server-init.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
# ```
