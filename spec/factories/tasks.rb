FactoryBot.define do

  # タスクを作成する。だけどタスクはユーザーが作成することになるのでUserオブジェクトを関連付ける必要がある。
  factory :task, class: Task do
    name { 'タスクなんだよ' }
    description { 'Rspecを勉強しているのだよ。そう見えるでしょ？' }
    association :user, factory: :user
  end


  # 管理者のタスクを作成しました。管理者が作成したことにするために管理ユーザーを紐づけたのです。
  factory :admin_task, class: Task do
    name { '管理者のタスクなんだよ' }
    description { '【管理者】Rspecを勉強しているのだよ。そう見えるでしょ？' }
    association :user, factory: :admin_user
  end


  # factory :task do
  #   name { 'テストを書く' }
  #   description { 'RSpec & Capybara & FactoryBotを準備する' }
  #   association :user, factory: :staitc_user
  # end

  # ユーザーでクラスを推測することができない場合は association:キーと factory:キーを利用して:adminを定義する。
  # factory :task_admin, class: Task do
  #   name { '管理者だぞ。' }
  #   description { 'RSpec & Capybara & FactoryBotを準備する' }
  #   # ↓ これを定義することもできるが後からどうせファクトリで追加することもできるので今追加する必要はないかもしれない。
  #   association :user, factory: :admin
  # end

  # factory :task2, class: Task do
  #   sequence(:name) { |n| "管理者だぞ。#{n}"}
  #   sequence(:description) { |n| "TEST#{n}@example.com"}
  #   association :user, factory: :admin
  # end
end
