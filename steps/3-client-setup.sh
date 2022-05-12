#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 3. React クライアント側 セットアップ

# 次に、Reactクライアントをセットアップします。

# :large_orange_diamond: Action: 新しいターミナルを開いてください。

# ![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/321bc58b-7bbe-988e-c51c-f2fe16f3ceb2.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/d569883.patch
git apply patches/6186b50.patch
git apply patches/bca253f.patch
git apply patches/dcd6de3.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
npm install
# npm run client-start
# ```

# :white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

# Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。そうすると、それ以降行うソースコード変更がわかりやすくなります。

# このプロセスは立ち上げたままにしてください。

# :large_orange_diamond: Action: 新しいターミナルを開いてください。

# ![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/d2baf20.patch
git apply patches/c5201f0.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

# 次に、ヘッダー部分を挿入します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/f2f7d08.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_14h41_01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1348e943-81f9-3a27-7303-478cbb04d75a.png)

# App.tsxにGraphQLを導入してみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/a1d6ca9.patch
# ```

# ここから先は、クライアント側でもGraphQLから自動生成されたTypeScript型定義を効かせてコーディングしていきます。そのために、codegenのセットアップを行いましょう。
