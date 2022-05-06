#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 1. 開発プロジェクトの初期設定

# このチュートリアルでは以下の画像のように、GraphQLサーバーとReactクライアントという2つの主要なプロセスを立ち上げて開発していきます。

# ![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d4c547fc-0cfc-19ff-ac0d-2accf5e5bd45.png)

### GraphQL サーバー セットアップ

# まずはGraphQLサーバーをセットアップしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh 
mkdir server
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh 
cd server
echo "node_modules" >> .gitignore
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
npm init -yes
npm install apollo-server graphql
npm install --save-dev typescript ts-node-dev 
npx tsc -init
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# # gitレポジトリのルートディレクトリに移動。
cd ../ 
# # git applyはレポジトリのルートディレクトリから実行する必要があります。なぜならpatches/*.patchファイルはすべて、レポジトリのルートからの相対パスを指定しているためです。
git apply patches/1-1.patch
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm set-script server-start "ts-node-dev --watch schema.gql,data.json --respawn index.ts"
# npm run server-start
# ```

# :white_check_mark: Result: 以下のようなApollo Studio Explorerの画面が表示されます。

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/58dd6755-b37b-9f64-3047-a1a2e8e7b0b9.png)

# :large_orange_diamond: Action: "Query your server"ボタンを押してください

# :white_check_mark: Result: 以下のような画面に遷移します。

# ![2022-03-06_09h04_06.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e32d47ea-e138-8beb-acec-1441174f7e11.png)

# :large_orange_diamond: Action: 以下のクエリをApollo Studio Explorerで入力してRunを押してください。

# ```terminal: メイン
# {
#   hello
# }
# ```

# :white_check_mark: Result: Stringのmock値である"Hello World"で埋められたレスポンスが得られます。

# これでGraphQサーバーが動作することを確認できました。後からもう一度立ち上げるので、いったんGraphQLサーバーを停止しましょう。

# :large_orange_diamond: Action: Ctrl+C

### React クライアント側 セットアップ

# 次に、Reactクライアントをセットアップします。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
cd ../ # gitレポジトリのルートディレクトリに移動
npx --yes create-react-app client --template typescript
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client 
npm install @apollo/client graphql
npm set-script client-start "react-scripts start"
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# npm run client-start
# ```

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

# :large_orange_diamond: Action: Ctrl+C

