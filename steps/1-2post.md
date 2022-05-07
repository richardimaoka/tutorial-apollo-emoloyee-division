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
