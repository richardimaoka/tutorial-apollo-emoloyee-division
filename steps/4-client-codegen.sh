#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 4. クライアント側codegenのセットアップ

# サーバー側だけではなく、クライアント側でもcodegnを使えば、自動生成された型定義で間違いを防げます。

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/29870265-68f3-2a32-7c89-d0b930f42aba.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# gitレポジトリのルートディレクトリに移動
git apply patches/3-server-codegen-install.patch
git apply patches/3-server-codegen-yml.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
npm set-script server-generate "graphql-codegen --config codegen.yml --watch ./schema.gql"
# ```

# <details><summary>上記と同等のコマンドはこちら。</summary><div>

# 上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

# しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

# ```terminal: メイン
# # shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
# cd server
# npm install @graphql-codegen/cli
# npx graphql-codegen init
# # あとは対話式インターフェイスが立ち上がるので質問に答える
# # 必要に応じて適宜config.ymlを修正 https://www.graphql-code-generator.com/docs/config-reference/codegen-config
# ```

# ---

# </div></details>

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
# npm run server-generate

# ```

# :white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
