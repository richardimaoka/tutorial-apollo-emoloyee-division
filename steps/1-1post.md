<details><summary>上記のコマンドはと同等のコマンドはこちら。</summary><div>

上記のコマンドは以下のコマンドの結果を`.patch`ファイルにまとめたものです。

しかし、以下のコマンドではなく `.patch` ファイルを利用する上記のコマンドをおすすめします。なぜなら、以下のコマンドでは実行のたびに結果が変わる可能性があり、この先のチュートリアルの手順でエラーを発生させてしまうかもしれないからです。

```terminal: メイン
mkdir server
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm init -yes
echo "node_modules" >> .gitignore
npm install apollo-server graphql
npm install --save-dev typescript ts-node-dev
npx tsc -init
```

---

</div></details>
