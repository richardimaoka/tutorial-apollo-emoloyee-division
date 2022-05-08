#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 3. React クライアント側 セットアップ

# 次に、Reactクライアントをセットアップします。

# :large_orange_diamond: Action: 新しいターミナルを開いてください。

# ![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a89cb30f-6c50-879c-737a-f601980a140d.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply 
3cf13af create-react-app
0fa66f2 npx prettier --write .
5019eac npm install @apollo/client graphql
9f32946 npm set-script client-start "react-scripts start"
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
# npm install
# npm run client-start
# ```

# :white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

# Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。そうすると、それ以降行うソースコード変更がわかりやすくなります。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
cd ../
git apply
4ce7a24 index.html and index.css updated
d389589 simplify App.tsx
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
793c3bf Header Component
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

# 次に、ヘッダー部分を挿入します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
793c3bf Header Component
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_14h41_01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1348e943-81f9-3a27-7303-478cbb04d75a.png)

# App.tsxにGraphQLを導入してみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
793c3bf Header Component
# ```

# ここから先は、クライアント側でもGraphQLから自動生成されたTypeScript型定義を効かせてコーディングしていきます。そのために、codegenのセットアップを行いましょう。
