## 0. はじめに

GraphQL を学びたい JavaScript 初心者へ向けてチュートリアルを用意しました。

理解の前に「動かす感覚」を味わってもらうため、**ほぼ全てコピー&ペーストのみで**、素早く進められるチュートリアルになっています。

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


## 3. クライアント・サーバー間の通信開始

ここからはクライアント・サーバー間の通信を始めましょう。まずはその前段階としてcodegen導入からです。

### サーバー側GraphQL codegen導入

codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
gitレポジトリのルートディレクトリに移動
git apply patches/3-server-codegen-install.patch
git apply patches/3-server-codegen-yml.patch
cd server
npm install
npm set-script server-generate "graphql-codegen --config codegen.yml --watch ./schema.gql"
```

<details><summary>上記と同等のコマンドはこちら。</summary><div>

上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

```terminal: メイン
cd server
npm install @graphql-codegen/cli
npx graphql-codegen init
# あとは対話式インターフェイスが立ち上がるので質問に答える
# 必要に応じて適宜config.ymlを修正 https://www.graphql-code-generator.com/docs/config-reference/codegen-config
```

---

</div></details>

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
npm run server-generate

```

:white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。


### クライアント側 codegen

###

npm install --save-dev @graphql-codegen/cli


## 1. GraphQLサーバーのセットアップ

このチュートリアルでは以下の画像のように、4つのプロセスを立ち上げます。まずはGraphQLサーバープロセスを立ち上げていきましょう。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6d1717b1-a470-89da-ef41-58670a898c23.png)

まずは GraphQLサーバーをセットアップしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: GraphQLサーバー
git apply patches/1-server-init.patch
git apply patches/1-server-startup-files.patch
git apply patches/1-server-set-script.patch
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




## 2. サーバー側GraphQL codegen導入

![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/31eac510-efac-6ac5-8376-8b95b8758e2c.png)

codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: サーバーcodegen
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/1-server-codegen-install.patch
git apply patches/1-server-codegen-yml.patch
git apply patches/1-server-codegen-set-script.patch
cd server
npm install
npm run server-generate
```

:white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。


## 3. React クライアント側 セットアップ

![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a89cb30f-6c50-879c-737a-f601980a140d.png)

次に、Reactクライアントをセットアップします。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

:large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

```terminal: メイン
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/1-client-init.patch
cd client
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
npm set-script client-start "react-scripts start"
npm run client-start
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)




## 2. React クライアント更新

### クライアント側の単純化

先程の手順で作成した、Reactロゴがくるくる回る状態では今後不要になるコードがいくぶん含まれています。そこで不要なコードを消去してReactクライアント側のコードを単純化しましょう。

:large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

```terminal: メイン
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/2-simplify-app-tsx.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/dc66f41c-24c7-2b00-2a2b-3a3937b05a27.png)

次に、index.htmlにWebフォントを追加し、index.cssから不要な記述を削除します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
rm client/src/index.css
rm client/public/index.html
git apply patches/2-index-html-css.patch
```

### ヘッダーコンポーネントの追加

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
git apply patches/2-header-component.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-07_15h40_32.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/680e1428-114e-96e5-bea8-452ec565415f.png)

### Apollo Clientの導入

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
git apply patches/2-apollo-client.patch
```

ここまででApollo Clientの導入はできましたが、GraphQLサーバーからデータを取得するには、サーバー側でスキーマを更新します。


### サーバー側 3部門 with fewer fields



### Divisionカード init 


### 
