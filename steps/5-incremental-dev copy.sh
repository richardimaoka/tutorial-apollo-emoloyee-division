#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

## 5. インクリメンタルな開発

# さあ、いよいよ…

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ![アートボード 6.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/83e08d04-4c90-31f8-e4fd-62accf7f6da4.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
# # gitレポジトリのルートディレクトリに移動
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd "$(git rev-parse --show-toplevel)"
git apply
bd67a1f update DivisionCard.tsx to take generated DivisionCardFragment
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
b7bd9c9 CompanyPage.tsx
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![]()

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
4bdffb8 Add divisionDisplayName
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![]()

# DivisionCardの見た目を整えていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
309b3b6 make DivisionCard as cards visually
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![]()

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
0214b64 decorate DivisionCard title
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h01_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cd36d93a-c0bb-39eb-5932-54a85bfe2401.png)

# 各部門に属する部署の数と人数を表示してみましょう。GraphQLにフィールド `numDepartments` と `numMembers` を追加します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
be7ec9c add numMembers and numDepartments
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h00_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/c05f3746-9b25-2053-6a05-dc04f3220e3d.png)

# 各部門のカード右下に英語部門名も表示してみましょう。GraphQLにフィールド `divisionDisplayNameEn` を追加します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
00f6142 add English division names
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h19_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/925aeeee-0ee8-6b6d-9d3c-b233e92dd808.png)

# 表示される部門の数を増やしてみましょう。そのためには、GraphQL Queryの`divisions`フィールドの戻り値の要素数を増やします。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal
git apply
78c545c (client-after-server) more divisions
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-08_15h22_55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9056966a-a0de-44cc-c0d8-224e610a3046.png)

