#!/bin/sh

cd "$(dirname "$0")" || exit 
cd ../ || exit # cd to the git repository root

(cd server && npm run server-start &)

(cd server && npm run server-generate &)

(cd client && npm run client-start &)

(cd client && npm run client-generate &)

echo "バックグラウンドプロセスを複数立ち上げました。すべてを終了するにはこのターミナルを閉じてください。"

# wait infinitely
tail -f /dev/null