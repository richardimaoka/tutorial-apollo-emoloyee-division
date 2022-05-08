#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 2. サーバー側GraphQL codegen導入

# ![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/31eac510-efac-6ac5-8376-8b95b8758e2c.png)

# codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

# 実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: サーバーcodegen
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/2-server-codegen-install.patch
git apply patches/2-server-codegen-yml.patch
git apply patches/2-server-codegen-set-script.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
# npm run server-generate
# ```

# :white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
