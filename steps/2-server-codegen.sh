#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 2. サーバー側GraphQL codegen導入

# codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、codegenで型を自動生成しましょう。

# 実際に自動生成される型定義を見ると、これがどのくらい便利なのか一目瞭然です。早速動かしていきましょう。

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f070b897-1556-b705-d4af-d204b44fff70.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal:
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/88b1ced.patch
git apply patches/1f78fa0.patch
git apply patches/af44310.patch
git apply patches/1de3257.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
# npm run server-generate
# ```

# :white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。

# このプロセスは立ち上げたままにしてください。
