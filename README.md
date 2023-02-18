# アノテーションコメント
```
$ docker compose run web rails notes (--annotations TODO)
```

# seed_fuの実行
```
$ docker compose run web rails db:seed_fu
```

# rubocopの実行
```
$ docker compose run web rubocop -A
```

# 強制プッシュ時の方法
```
$ git push --force-with-lease origin ブランチ名
```

# テストについて
```
テストツール
・Rspec(コードのテスト自動化 ※単体テスト)
 →MVCそれぞれコードベースのテストが書けるものだが、実際はモデルかコントローラのAPI(RequestSpec)のみテストする

・Capybara(手動テストの自動化 ※統合テスト)
 →ビューをテストする、Rspecとは別のgemを導入する必要がある
 →seleniumが含まれる(Rspecと同じ記述方法で使える)

 テストの記述
 ・テストは正常系と異常系の2パターンを書く
```

# テンプレート
```
$
```
