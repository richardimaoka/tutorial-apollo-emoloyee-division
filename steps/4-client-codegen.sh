#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 4. クライアント側codegenのセットアップ

# サーバー側だけではなく、クライアント側でもcodegnを使えば、自動生成された型定義で楽をできる上に、手書きをする場合と比べて型の書き間違いを防げます。

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6fbd7901-ca6b-ed1a-da43-26ebc7ce16cd.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/6dae1d9.patch
git apply patches/0cdd81d.patch
git apply patches/56bb5dc.patch
git apply patches/db72e9f.patch
# ```

# GraphQLスキーマが `hello: String` というフィールドしかない、その場しのぎのものだったので、これを更新します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/f28d1c1.patch
# ```

# この状態ではまだ、クライアント側codegenを実行するとエラーが発生します。それを以下で確かめましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
npm install
npm run client-codegen 
# npm run client-generate
# ```

# :white_check_mark: Result: エラーが発生します。

# ```terminal
#  Found 1 error
#
#   ✖ src/generated/graphql.ts
#     Error: 
#           Unable to find any GraphQL type definitions for the following pointers:
#        
#               - src/**/*.tsx
# ```

# このプロセスは立ち上げたままにしてください。

# 先程のエラーを解消するために、クライアント側で最初のGraphQLフラグメントを定義します。

# :large_orange_diamond: Action: 以前に立ち上げた、別のターミナルに移動してください。

# ![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/29c4cb7.patch
# ```

# :white_check_mark: Result: `client/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
