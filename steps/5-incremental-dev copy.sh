#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 5. インクリメンタルな開発

# さあ、いよいよここからはReactクライアント画面の表示を次々に変化させていく、インクリメンタルな開発を行います。ソースコードの変更がすぐに画面の表示の変化となって表れるので、きっと手応えを感じていただけると思います。

# 以前に立ち上げた、4つのプロセスとは別のターミナルを引き続き使います。

# ![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# まずはGraphQLサーバーから取得した部署の名前を表示しましょう。

# ```terminal
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply patches/fc58873.patch
git apply patches/fc67eea.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/fa3b30cc-253c-3685-6187-a7c4275de021.png)

# 次に、部署名の表示を日本語に変えます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/8af8eb9.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8f834abc-737e-4a34-15b0-bdbe1f91d34f.png)

# DivisionCardの見た目を整えていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/c40553d.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h01_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1f6fb19c-95a6-95e1-fc3d-33a602a30260.png)

# 各部門に属する部署の数と人数を表示してみましょう。GraphQLにフィールド `numDepartments` と `numMembers` を追加します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/a806910.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h00_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1be85e13-4b3c-684f-56f5-1c903ed59ee3.png)

# 各部門のカード右下に英語部門名も表示してみましょう。GraphQLにフィールド `divisionDisplayNameEn` を追加します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/737806f.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h19_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e74238b5-8f19-8be3-2ec7-df9608258e49.png)

# 最後に、表示される部門の数を増やしてみましょう。そのためには、GraphQL Queryの`divisions`フィールドの戻り値の要素数を増やします。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply patches/3f1bc4f.patch
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h22_55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9056966a-a0de-44cc-c0d8-224e610a3046.png)

