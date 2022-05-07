#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply -p1 ../patches/1-server-start.patch
npm set-script server-start "ts-node-dev --watch schema.gql,data.json --respawn index.ts"
# npm run server-start
# ```

