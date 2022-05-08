#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

### サーバー側GraphQL codegen導入

# codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

# 実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: サーバーcodegen
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/1-server-codegen-install.patch
git apply patches/1-server-codegen-yml.patch
git apply patches/1-server-codegen-set-script.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
# npm run server-generate
# ```

# :white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
