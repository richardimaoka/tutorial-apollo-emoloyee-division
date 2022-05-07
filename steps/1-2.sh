#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

### React クライアント側 セットアップ

# 次に、Reactクライアントをセットアップします。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# <details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

# 上記のコマンドは以下のコマンドの結果を一つの `.patch`ファイルにまとめたものです。

# しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドは実行のたびにpackage.json内 `dependencies` `devDependencies` のバージョンが変わるからです。それは、バージョンの差異による動作の違いを引き起こす可能性があります。

# ```terminal: メイン
cd ../ # gitレポジトリのルートディレクトリに移動
npx --yes create-react-app client --template typescript
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd client 
npm install @apollo/client graphql
npx prettier --write .
# ```

# また、create-react-appが出力するファイル、たとえばApp.tsxなども今後変更される可能性があり、そうなるとこの先のチュートリアルで実行する `git apply`がエラーになる原因にもなります。

# ---

# </div></details>

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
npm set-script client-start "react-scripts start"
# npm run client-start
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)


