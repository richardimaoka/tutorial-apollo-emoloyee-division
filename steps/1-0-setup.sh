#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# # 1. 開発プロジェクトの初期設定

# このチュートリアルでは以下の画像のように、GraphQL サーバーと React クライアントという 2 つの主要なプロセスを立ち上げて開発していきます。

# ![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d4c547fc-0cfc-19ff-ac0d-2accf5e5bd45.png)

# ## GraphQLサーバーとReactクライアントをセットアップ

# まずは GraphQL サーバーをセットアップしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches/1-server-client-setup
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
(cd server && npm install)
(cd client && npm install)
# ```
