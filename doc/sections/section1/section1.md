# タスクプロジェクトを作成する

タスクモデルを作成する<br>
モデルのクラス名とデータベースのテーブル名には以下のような命名規則があります。

- データベースのテーブル名はモデルのクラス名を複数形にしたもの
- モデルのクラス名はキャメルケース、テーブル名はスネークケース

 ## タスクモデル

`id`,`created_at`,`updated_at`はRailsが自動で付与してくれる

|属性の意味|属性名・カラム名|データ型|NULL許可|デフォルト|
|-|-|-|-|-
|名称|name|string|×|-
|詳しい説明|description|text|○|-

```sh
# クラス名は大文字表記で定義する
$ bin/rails generate model Task name:string description:text
```

## コントローラとビュー

|URLの例|HTTPメソッド|アクション名|機能名|役割
|-|-|-|-|-
|tasks|GET|index|一覧表示|全タスクを表示
|tasks/17|GET|show|詳細表示|特定のIDのタスクを表示
|tasks/new|GET|new|新規登録画面|新規登録画面を表示
|tasks|POST|create|登録|登録処理を行う
|tasks/17/edit|GET|edit|編集画面|編集画面を表示する
|tasks/17|PATCH, PUT|update|更新|更新処理を行う
|tasks/17|DELETE|destroy|削除|削除処理を行う
