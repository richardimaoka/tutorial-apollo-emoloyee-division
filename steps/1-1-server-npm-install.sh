#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# # 1. 開発プロジェクトの初期設定

# このチュートリアルでは以下の画像のように、GraphQL サーバーと React クライアントという 2 つの主要なプロセスを立ち上げて開発していきます。

# ![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d4c547fc-0cfc-19ff-ac0d-2accf5e5bd45.png)

# ## GraphQL サーバー セットアップ

# まずは GraphQL サーバーをセットアップしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches/1-server-init.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
# ```

# <details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

# 上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

# しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

# ```terminal: メイン
# mkdir server
# # shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
# cd server
# npm init -yes
# echo "node_modules" >> .gitignore
# npm install apollo-server graphql
# npm install --save-dev typescript ts-node-dev
# npx tsc -init
# ```

# ---

# </div></details>

# 次に GraphQL サーバーを立ち上げるのに最低限必要なファイルを追加します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply -p1 ../patches/1-server-start.patch
npm set-script server-start "ts-node-dev --watch schema.gql,data.json --respawn index.ts"
# npm run server-start
# ```

# :large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

# :white_check_mark: Result: 以下のような Apollo Studio Explorer の画面が表示されます。

# ![2022-05-06_20h54_04.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/4f58c6b3-6efe-f0de-28cd-012fdecb499b.png)

# :large_orange_diamond: Action: "Query your server"ボタンを押してください

# :white_check_mark: Result: 以下のような画面に遷移します。

# ![2022-03-06_09h04_06.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e32d47ea-e138-8beb-acec-1441174f7e11.png)

# :large_orange_diamond: Action: 以下のクエリを Apollo Studio Explorer で入力して Run を押してください。

# ```terminal: メイン
# {
#   hello
# }
# ```

# :white_check_mark: Result: GraphQL サーバーから以下のレスポンスが得られます。

# ![2022-05-06_20h23_16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cf7b77e0-9f56-ee9f-d767-563213a7c442.png)

# これで GraphQ サーバーが動作することを確認できました。


