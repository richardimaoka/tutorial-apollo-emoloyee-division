#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 2. React クライアント更新

### クライアント側の単純化

# 先程の手順で作成した、Reactロゴがくるくる回る状態では今後不要になるコードがいくぶん含まれています。そこで不要なコードを消去してReactクライアント側のコードを単純化しましょう。

# :large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

# ```terminal: メイン
cd ../ # gitレポジトリのルートディレクトリに移動。
git apply patches/2-simplify-app-tsx.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/dc66f41c-24c7-2b00-2a2b-3a3937b05a27.png)

# 次に、index.htmlにWebフォントを追加し、index.cssから不要な記述を削除します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
rm client/src/index.css
rm client/public/index.html
git apply patches/2-index-html-css.patch
# ```

### ヘッダーコンポーネントの追加

# 次に、ヘッダーコンポーネントを追加します

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches/2-header-component.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-07_14h15_01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ade07545-cace-834a-9d22-bbc8d18c0442.png)

### Apollo Clientの導入

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
git apply patches/2-apollo-client.patch
# ```

