#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 4. クライアント側codegenのセットアップ

# サーバー側だけではなく、クライアント側でもcodegnを使えば、自動生成された型定義で楽をできる上に、手書きをする場合と比べて型の書き間違いを防げます。

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/29870265-68f3-2a32-7c89-d0b930f42aba.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply
546870 npm install --save-dev @graphql-codegen/cli
0a77aa2 npm install --save-dev @graphql-codegen/typescript @graphql-codegen/typescript-operations @graphql-codegen/typescript-react-apollo
ff914c7 codegen.yml
ff2266e npm set-script client-generate "graphql-codegen --config codegen.yml --watch src/**/*.tsx,../server/schema.gql"
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
npm install
# ```

# GraphQLスキーマが `hello: String` というフィールドしかない、その場しのぎのものだったので、これを更新します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
cd ../
git apply
7bc6da2 server actual data 
# ```

# この状態ではまだ、クライアント側codegenを実行するとエラーが発生します。それを以下で確かめましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# npm run client-generate
# ```

# :white_check_mark: Result: エラーが発生します。

# ```terminal
# ERROR!!!
# ```

# :large_orange_diamond: Action: Ctrl + Cで一旦プロセスを停止してください。

# 先程のエラーを解消するために、クライアント側で最初のGraphQLフラグメントを定義します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
319360d DivisionCard.tsx barebone to codegen type definitions
# npm run client-generate
# ```

# :white_check_mark: Result: `client/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。
