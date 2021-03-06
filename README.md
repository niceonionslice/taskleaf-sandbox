# README

```
About your application's environment
Rails version             5.2.2
Ruby version              2.5.1-p57 (x86_64-darwin17)
RubyGems version          3.0.2
Rack version              2.0.6
JavaScript Runtime        Node.js (V8)
Middleware                Rack::Sendfile, ActionDispatch::Static, ActionDispatch::Executor, ActiveSupport::Cache::Strategy::LocalCache::Middleware, Rack::Runtime, Rack::MethodOverride, ActionDispatch::RequestId, ActionDispatch::RemoteIp, Sprockets::Rails::QuietAssets, Rails::Rack::Logger, ActionDispatch::ShowExceptions, WebConsole::Middleware, ActionDispatch::DebugExceptions, ActionDispatch::Reloader, ActionDispatch::Callbacks, ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, ActionDispatch::Flash, ActionDispatch::ContentSecurityPolicy::Middleware, Rack::Head, Rack::ConditionalGet, Rack::ETag, Rack::TempfileReaper
Application root          own/path/taskleaf-sandbox
Environment               development
Database adapter          mysql2
Database schema version   0
```

## gitbookの使い方

プロジェクトの仕様や設計をまとめる。

```
$ gitbook init # 作成
$ gitbook serve # レビュー
$ gitbook build # ジェネレータ
```

## elb -> slimに変換

```
$ bundle exec erb2slim ./app/views/layouts/ --delete
```

## locales

とりあえず、英語と日本語を以下よりDLする。

```
$ wget https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/en.yml -P config/locales/
$ wget https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -P config/locales/
```

## mailerの検証

```
# インストール時
$ gem install mailcatcher

# サーバー立ち上げ
$ mailcatcher
```

Content-typeはmultipart/alternativeで送信する
htmlメールのみ送信すると携帯メールなどで表示できないユーザーもいるしスパム扱いされやすくなります。multipart/alternativeは本文にhtmlとtextを両方含み、htmlで表示できない場合にはtextで表示します。
Railsではmailerにhogehogeというメソッドがあったら、viewにhogehoge.html.erb、hogehoge.text.erbと２つ作れば自動的にmultipart/alternativeにしてくれます。


## 非同期ジョブ実行について
sidekiqを利用して非同期ジョブを利用します。
```
$ bundle run sidekiq
```
