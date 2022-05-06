#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 2. React クライアント側でのGraphQL導入

### クライアント側にヘッダーコンテナを追加

# create-react-appで作成した、Reactロゴがくるくる回る状態から見た目を変えていきましょう。今回のチュートリアルは社員録アプリケーションの想定なので、会社名を表すヘッダーコンテナを追加します。

# まずはその準備として、App.tsxを単純化します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
cd ../
git apply patches/2-1.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/dc66f41c-24c7-2b00-2a2b-3a3937b05a27.png)

# 次に、index.htmlにWebフォントを追加し、index.cssから不要な記述を削除します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン
cd ../
git apply patches/2-2.patch
# ```
