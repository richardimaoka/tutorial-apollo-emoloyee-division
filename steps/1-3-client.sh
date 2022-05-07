#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

### React クライアント側 セットアップ

# 次に、Reactクライアントをセットアップします。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

# :large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

# ```terminal: メイン
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/1-client-init.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
# ```

# <details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

# 上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

# しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

# ```terminal: メイン
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
# cd "$(git rev-parse --show-toplevel)"
# npx --yes create-react-app client --template typescript
# # shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
# cd client 
# npm install @apollo/client graphql
# npx prettier --write .
# ```

# ---

# </div></details>

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
npm set-script client-start "react-scripts start"
# npm run client-start
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)


