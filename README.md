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


# deviseコマンドについて
```
・deviseのユーザモデル作成(初期設定)
$rails g devise user

・deviseのView作成
$rails g devise:views users

・deviseのcontroller作成
$rails g devise:controllers users

・deviseのルーティング設定
例:
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions     : 'users/sessions'
  }

```

# flashの記述
```
flash[:notice]: ユーザーに表示する通知メッセージを設定するキー。緑色の背景色が一般的です。
flash[:alert]: ユーザーに表示するエラーメッセージを設定するキー。赤い背景色が一般的です。
flash[:warning]: ユーザーに表示する警告メッセージを設定するキー。黄色の背景色が一般的です。
flash[:success]: ユーザーに表示する成功メッセージを設定するキー。緑色の背景色が一般的です。
```

# 部分テンプレート
```
パスの指定はview以下を指定する
例："layouts/side_bar"
```

# Railsのメソッド
```
current_page?(URL)でページの判別ができる
```

# テンプレート
```
$
```
