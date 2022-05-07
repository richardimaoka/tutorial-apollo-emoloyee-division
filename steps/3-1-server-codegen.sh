#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 3. クライアント・サーバー間の通信開始

# ここからはクライアント・サーバー間の通信を始めましょう。まずはその前段階としてcodegen導入からです。

### サーバー側GraphQL codegen導入

# codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

# 実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches//patches/3-server-codegen-install.patch
git apply patches//patches/3-server-codegen-yml.patch
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
npm run server-generate
# ```

# :white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
