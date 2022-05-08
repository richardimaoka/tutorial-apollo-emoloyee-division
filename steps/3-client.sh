#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 3. React クライアント側 セットアップ

# ![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a89cb30f-6c50-879c-737a-f601980a140d.png)

# 次に、Reactクライアントをセットアップします。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

# :large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

# ```terminal: メイン
# gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/3-create-react-app.patch
git apply patches/3-prettier.patch
git apply patches/3-set-script.patch
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
npm set-script client-start "react-scripts start"
# npm run client-start
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)


