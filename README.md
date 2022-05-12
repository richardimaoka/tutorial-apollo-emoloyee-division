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

このチュートリアルでは以下の画像のように、4つのプロセス(上段)と、さらに1つのターミナル(下段)を立ち上げます。合計で5つと数は多いですが、使い分けは簡単なので心配しないでください。

![アートボード 1.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/0b6ce57a-663d-3403-99ed-54683644fd7c.png)

まずは GraphQLサーバーをセットアップしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/201ea30.patch
git apply patches/f482a1d.patch
git apply patches/b979ec5.patch
git apply patches/425a387.patch
git apply patches/5847c01.patch
git apply patches/ac56d80.patch
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

実際に自動生成される型定義を見ると、これがどのくらい便利なのか一目瞭然です。早速動かしていきましょう。

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f070b897-1556-b705-d4af-d204b44fff70.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal:
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/88b1ced.patch
git apply patches/1f78fa0.patch
git apply patches/af44310.patch
git apply patches/1de3257.patch
cd server
npm install
npm run server-generate
```

:white_check_mark: Result: `server/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。

このプロセスは立ち上げたままにしてください。


## 3. React クライアント側 セットアップ

次に、Reactクライアントをセットアップします。

:large_orange_diamond: Action: 新しいターミナルを開いてください。

![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/321bc58b-7bbe-988e-c51c-f2fe16f3ceb2.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/d569883.patch
git apply patches/6186b50.patch
git apply patches/bca253f.patch
git apply patches/dcd6de3.patch
cd client
npm install
npm run client-start
```

:white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。そうすると、それ以降行うソースコード変更がわかりやすくなります。

このプロセスは立ち上げたままにしてください。

:large_orange_diamond: Action: 新しいターミナルを開いてください。

![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/d2baf20.patch
git apply patches/c5201f0.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

次に、ヘッダー部分を挿入します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/f2f7d08.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_14h41_01.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1348e943-81f9-3a27-7303-478cbb04d75a.png)

App.tsxにGraphQLを導入してみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/a1d6ca9.patch
```

ここから先は、クライアント側でもGraphQLから自動生成されたTypeScript型定義を効かせてコーディングしていきます。そのために、codegenのセットアップを行いましょう。


## 4. クライアント側codegenのセットアップ

サーバー側だけではなく、クライアント側でもcodegnを使えば、自動生成された型定義で楽をできる上に、手書きをする場合と比べて型の書き間違いを防げます。

:large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

![アートボード 4.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6fbd7901-ca6b-ed1a-da43-26ebc7ce16cd.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/6dae1d9.patch
git apply patches/0cdd81d.patch
git apply patches/56bb5dc.patch
git apply patches/db72e9f.patch
```

GraphQLスキーマが `hello: String` というフィールドしかない、その場しのぎのものだったので、これを更新します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/f28d1c1.patch
```

この状態ではまだ、クライアント側codegenを実行するとエラーが発生します。それを以下で確かめましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
cd client
npm install
npm run client-codegen 
npm run client-generate
```

:white_check_mark: Result: エラーが発生します。

```terminal
 Found 1 error
#
  ✖ src/generated/graphql.ts
    Error: 
          Unable to find any GraphQL type definitions for the following pointers:
       
              - src/**/*.tsx
```

このプロセスは立ち上げたままにしてください。

先程のエラーを解消するために、クライアント側で最初のGraphQLフラグメントを定義します。

:large_orange_diamond: Action: 以前に立ち上げた、別のターミナルに移動してください。

![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/29c4cb7.patch
```

:white_check_mark: Result: `client/generated/graphql.ts` ファイルに型定義が自動生成されればOKです。


## 5. インクリメンタルな開発

さあ、いよいよここからはReactクライアント画面の表示を次々に変化させていく、インクリメンタルな開発を行います。ソースコードの変更がすぐに画面の表示の変化となって表れるので、きっと手応えを感じていただけると思います。

以前に立ち上げた、4つのプロセスとは別のターミナルを引き続き使います。

![アートボード 5.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/928b1a5f-84c8-e803-74b6-7386542a4f56.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

まずはGraphQLサーバーから取得した部署の名前を表示しましょう。

```terminal
# gitレポジトリのルートディレクトリに移動
cd "$(git rev-parse --show-toplevel)"
git apply patches/fc58873.patch
git apply patches/fc67eea.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/fa3b30cc-253c-3685-6187-a7c4275de021.png)

次に、部署名の表示を日本語に変えます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/8af8eb9.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8f834abc-737e-4a34-15b0-bdbe1f91d34f.png)

DivisionCardの見た目を整えていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/c40553d.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h01_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1f6fb19c-95a6-95e1-fc3d-33a602a30260.png)

各部門に属する部署の数と人数を表示してみましょう。GraphQLにフィールド `numDepartments` と `numMembers` を追加します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/a806910.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h00_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1be85e13-4b3c-684f-56f5-1c903ed59ee3.png)

各部門のカード右下に英語部門名も表示してみましょう。GraphQLにフィールド `divisionDisplayNameEn` を追加します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/737806f.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h19_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e74238b5-8f19-8be3-2ec7-df9608258e49.png)

最後に、表示される部門の数を増やしてみましょう。そのためには、GraphQL Queryの`divisions`フィールドの戻り値の要素数を増やします。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal
git apply patches/3f1bc4f.patch
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-08_15h22_55.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9056966a-a0de-44cc-c0d8-224e610a3046.png)

## 6. まとめ

以上が 企業の社員録をイメージした、部門一覧ページを題材に React クライアントと GraphQL サーバーとの間で通信して構築するアプリケーションを紹介しました。。

### 次のチュートリアル

(作成中) 企業の社員録をイメージした、部門内の社員一覧ページ
