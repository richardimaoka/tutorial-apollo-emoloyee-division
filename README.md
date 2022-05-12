## 0. はじめに

GraphQL を学びたい JavaScript 初心者へ向けてチュートリアルを用意しました。理解の前に「動かす感覚」を味わってもらうため、**ほぼ全てコピー&ペーストのみで**、素早く進められるチュートリアルになっています。

今回の題材は、企業の社員録をイメージした、部門一覧ページです。

![2022-05-08_15h22_55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9056966a-a0de-44cc-c0d8-224e610a3046.png)

社員録と言いつつ、社員個人個人の情報を表示する部分はありませんが、それらは後続の別チュートリアルの中で作成する予定です。

### 以前の内容

- [コピペで素早く学ぶ GraphQL: Apollo Server Getting Started](https://qiita.com/RichardImaokaJP/items/ca32e73f922673bc95a5)
- [コピペで素早く学ぶ GraphQL: Apollo Server Getting Resolver](https://qiita.com/RichardImaokaJP/items/2abd1a4200c6dbe45ee6)
- [コピペで素早く学ぶ GraphQL: サンプル「自己紹介ページ」](https://qiita.com/RichardImaokaJP/items/e96fbad3909e791094d2)

### 事前準備

node と npm がインストール済みであることを確認して下さい。

### git レポジトリのクローン

:large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

```terminal
git clone https://github.com/richardimaoka/tutorial-apollo-employee-division.git
cd tutorial-apollo-employee-division
```


## 1. GraphQLサーバーのセットアップ

このチュートリアルでは以下の画像のように、4つのプロセスを立ち上げます。まずはGraphQLサーバープロセスを立ち上げていきましょう。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6d1717b1-a470-89da-ef41-58670a898c23.png)

まずは GraphQLサーバーをセットアップしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: GraphQLサーバー
git apply 
201ea30 add .gitignore
f482a1d npm init -yes
b979ec5 npm install apollo-server graphql
425a387 npm install --save-dev ts-node-dev typescript
5847c01 npx tsc -init
ac56d80 server necessary files to start
cd server
npm install
npm run server-start
```

:large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

:white_check_mark: Result: 以下のような Apollo Studio Explorer の画面が表示されます。

![2022-05-06_20h54_04.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/4f58c6b3-6efe-f0de-28cd-012fdecb499b.png)

:large_orange_diamond: Action: "Query your server"ボタンを押してください

:white_check_mark: Result: 以下のような画面に遷移します。

![2022-03-06_09h04_06.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e32d47ea-e138-8beb-acec-1441174f7e11.png)

:large_orange_diamond: Action: 以下のクエリを Apollo Studio Explorer で入力して Run を押してください。

```terminal
{
  hello
}
```

:white_check_mark: Result: GraphQL サーバーから以下のレスポンスが得られます。

![2022-05-06_20h23_16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cf7b77e0-9f56-ee9f-d767-563213a7c442.png)

これで GraphQ サーバーが動作することを確認できました。

このプロセスは立ち上げたままにしてください。


## 2. サーバー側GraphQL codegen導入

codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、codegenで型を自動生成しましょう。

実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然です。早速動かしていきましょう。

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/31eac510-efac-6ac5-8376-8b95b8758e2c.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: サーバーcodegen
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/2-server-codegen-install.patch
git apply patches/2-server-codegen-yml.patch
git apply patches/2-server-codegen-set-script.patch
cd server
npm install
npm run server-generate
```

:white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。

このプロセスは立ち上げたままにしてください。


## 3. React クライアント側 セットアップ

次に、Reactクライアントをセットアップします。

:large_orange_diamond: Action: 新しいターミナルを開いてください。

![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a89cb30f-6c50-879c-737a-f601980a140d.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply 
3cf13af create-react-app
0fa66f2 npx prettier --write .
5019eac npm install @apollo/client graphql
9f32946 npm set-script client-start "react-scripts start"
cd client
npm install
npm run client-start
```

:white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。そうすると、それ以降行うソースコード変更がわかりやすくなります。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
cd ../
git apply
4ce7a24 index.html and index.css updated
d389589 simplify App.tsx
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

次に、ヘッダー部分を挿入します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
793c3bf Header Component
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_14h41_01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1348e943-81f9-3a27-7303-478cbb04d75a.png)

App.tsxにGraphQLを導入してみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
793c3bf Header Component
```

このプロセスは立ち上げたままにしてください。

ここから先は、クライアント側でもGraphQLから自動生成されたTypeScript型定義を効かせてコーディングしていきます。そのために、codegenのセットアップを行いましょう。


## 4. クライアント側codegenのセットアップ

サーバー側だけではなく、クライアント側でもcodegnを使えば、自動生成された型定義で楽をできる上に、手書きをする場合と比べて型の書き間違いを防げます。

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/29870265-68f3-2a32-7c89-d0b930f42aba.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply
546870 npm install --save-dev @graphql-codegen/cli
0a77aa2 npm install --save-dev @graphql-codegen/typescript @graphql-codegen/typescript-operations @graphql-codegen/typescript-react-apollo
ff914c7 codegen.yml
ff2266e npm set-script client-generate "graphql-codegen --config codegen.yml --watch src/**/*.tsx,../server/schema.gql"
cd client
npm install
```

GraphQLスキーマが `hello: String` というフィールドしかない、その場しのぎのものだったので、これを更新します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
cd ../
git apply
7bc6da2 server actual data 
```

この状態ではまだ、クライアント側codegenを実行するとエラーが発生します。それを以下で確かめましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
npm run client-generate
```

:white_check_mark: Result: エラーが発生します。

```terminal
ERROR!!!
```

:large_orange_diamond: Action: Ctrl + Cで一旦プロセスを停止してください。

先程のエラーを解消するために、クライアント側で最初のGraphQLフラグメントを定義します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
319360d DivisionCard.tsx barebone to codegen type definitions
npm run client-generate
```

:white_check_mark: Result: `client/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。

このプロセスは立ち上げたままにしてください。


## 5. インクリメンタルな開発

さあ、いよいよ…

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

![アートボード 6.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/83e08d04-4c90-31f8-e4fd-62accf7f6da4.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply
bd67a1f update DivisionCard.tsx to take generated DivisionCardFragment
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
b7bd9c9 CompanyPage.tsx
```

:white_check_mark: Result: 以下のように表示されればOKです

![]()

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
4bdffb8 Add divisionDisplayName
```

:white_check_mark: Result: 以下のように表示されればOKです

![]()

DivisionCardの見た目を整えていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
309b3b6 make DivisionCard as cards visually
```

:white_check_mark: Result: 以下のように表示されればOKです

![]()

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
0214b64 decorate DivisionCard title
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h01_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cd36d93a-c0bb-39eb-5932-54a85bfe2401.png)

各部門に属する部署の数と人数を表示してみましょう。GraphQLにフィールド `numDepartments` と `numMembers` を追加します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
be7ec9c add numMembers and numDepartments
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h00_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/c05f3746-9b25-2053-6a05-dc04f3220e3d.png)

各部門のカード右下に英語部門名も表示してみましょう。GraphQLにフィールド `divisionDisplayNameEn` を追加します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
00f6142 add English division names
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h19_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/925aeeee-0ee8-6b6d-9d3c-b233e92dd808.png)

表示される部門の数を増やしてみましょう。そのためには、GraphQL Queryの`divisions`フィールドの戻り値の要素数を増やします。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply
78c545c (client-after-server) more divisions
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h22_55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9056966a-a0de-44cc-c0d8-224e610a3046.png)

