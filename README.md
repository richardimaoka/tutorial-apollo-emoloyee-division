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

```terminal: メイン・ターミナル
git clone https://github.com/richardimaoka/tutorial-apollo-employee-division.git
cd tutorial-apollo-employee-division
```

後ほど別のターミナルを立ち上げるので、このターミナルは `メイン` と表記します。
1. 開発プロジェクトの初期設定

このチュートリアルでは以下の画像のように、GraphQL サーバーと React クライアントという 2 つの主要なプロセスを立ち上げて開発していきます。

![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d4c547fc-0cfc-19ff-ac0d-2accf5e5bd45.png)

## GraphQL サーバー セットアップ

まずは GraphQL サーバーをセットアップしていきましょう。


:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
git apply patches/1-server-init.patch
cd server
npm install
```
<details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

```terminal: メイン
mkdir server
cd server
npm init -yes
echo "node_modules" >> .gitignore
npm install apollo-server graphql
npm install --save-dev typescript ts-node-dev
npx tsc -init
```

---

</div></details>
次に GraphQL サーバーを立ち上げるのに最低限必要なファイルを追加します。


:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
git apply -p1 ../patches/1-server-start.patch
npm set-script server-start "ts-node-dev --watch schema.gql,data.json --respawn index.ts"
npm run server-start
```

:large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

:white_check_mark: Result: 以下のような Apollo Studio Explorer の画面が表示されます。

![2022-05-06_20h54_04.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/4f58c6b3-6efe-f0de-28cd-012fdecb499b.png)

:large_orange_diamond: Action: "Query your server"ボタンを押してください

:white_check_mark: Result: 以下のような画面に遷移します。

![2022-03-06_09h04_06.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e32d47ea-e138-8beb-acec-1441174f7e11.png)

:large_orange_diamond: Action: 以下のクエリを Apollo Studio Explorer で入力して Run を押してください。

```terminal: メイン
{
  hello
}
```

:white_check_mark: Result: GraphQL サーバーから以下のレスポンスが得られます。

![2022-05-06_20h23_16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/cf7b77e0-9f56-ee9f-d767-563213a7c442.png)

これで GraphQ サーバーが動作することを確認できました。


### React クライアント側 セットアップ

次に、Reactクライアントをセットアップします。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e58d21b4-2df8-cb25-4b63-dfaf12bb529c.png)

:large_orange_diamond: Action: 新しいターミナルを開いて、以下のコマンドを入力してください。

```terminal: メイン
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/1-client-init.patch
cd client
```

<details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

```terminal: メイン
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
npx --yes create-react-app client --template typescript
cd client 
npm install @apollo/client graphql
npx prettier --write .
```

---

</div></details>

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
cd ../ # gitレポジトリのルートディレクトリに移動。
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


## 3. クライアント・サーバー間の通信開始

ここからはクライアント・サーバー間の通信を始めましょう。まずはその前段階としてcodegen導入からです。

### サーバー側GraphQL codegen導入

codegenによりGraphQLスキーマファイル schema.graphql からTypeScriptの型を自動生成できます。自分で手を動かして型を書くと、面倒な上に間違いも起こりやすいので、型が自動生成しましょう。

実際に自動生成される型定義を見ると、どの部分の型を自分で書かなくて良くなるか一目瞭然なので、早速動かしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン
git apply patches//patches/3-server-codegen-install.patch
git apply patches//patches/3-server-codegen-yml.patch
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


### サーバー側 3部門 with fewer fields



### クライアント側 codegen



### Divisionカード init 


### 
