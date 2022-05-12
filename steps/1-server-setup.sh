#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 1. GraphQLサーバーのセットアップ

# このチュートリアルでは以下の画像のように、4つのプロセス(上段)と、さらに1つのターミナル(下段)を立ち上げます。合計で5つと数は多いですが、使い分けは簡単なので心配しないでください。

# ![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/0b6ce57a-663d-3403-99ed-54683644fd7c.png)

# まずは GraphQLサーバーをセットアップしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/201ea30.patch
git apply patches/f482a1d.patch
git apply patches/b979ec5.patch
git apply patches/425a387.patch
git apply patches/5847c01.patch
git apply patches/ac56d80.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install
npm run server-start
# ```

# :large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

# :white_check_mark: Result: 以下のような Apollo Studio Explorer の画面が表示されます。

# ![2022-05-06_20h54_04.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/4f58c6b3-6efe-f0de-28cd-012fdecb499b.png)

# :large_orange_diamond: Action: "Query your server"ボタンを押してください

# :white_check_mark: Result: 以下のような画面に遷移します。

# ![2022-03-06_09h04_06.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e32d47ea-e138-8beb-acec-1441174f7e11.png)

# :large_orange_diamond: Action: 以下のクエリを Apollo Studio Explorer で入力して Run を押してください。

# ```terminal
# {
#   hello
# }
# ```

# :white_check_mark: Result: GraphQL サーバーから以下のレスポンスが得られます。

# ![2022-05-06_20h23_16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cf7b77e0-9f56-ee9f-d767-563213a7c442.png)

# これで GraphQ サーバーが動作することを確認できました。

# このプロセスは立ち上げたままにしてください。
