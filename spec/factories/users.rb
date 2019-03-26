FactoryBot.define do

  # Userオブジェクトのテンプレートを作成します。

  factory :user, class: User do
    name { '一般ユーザー' }
    email { 'exsample@email.com' }
    password { 'password' }
  end


  # 管理者オブジェクトのテンプレートを作成します。
  factory :admin_user, class: User do
    name { '一般ユーザー' }
    email { 'exsample@email.com' }
    password { 'password' }    
  end

  # :userという名前からUserクラスであることをFactoryBotが推測してくれる。
  # factory :staitc_user, class: User do
  #   name { 'テストユーザー' }
  #   email { 'test1@example.com' }
  #   password { 'password' }
  # end

  # :user_adminという名前の定義を用意する場合は名前からクラスを推測することができないのでオプション class: を利用する
  # factory :admin, class: User do
  #   name { '管理ユーザー' }
  #   email { 'admin_user@example.com' }
  #   password { 'password' }
  # end

  # こっちを利用すればFactoryBot.createなどを呼ぶ前に中身を適当にいれてオブジェクトを作成することができる。
  # factory :user do
  #   sequence(:name) { |n| "TEST_NAME#{n}"}
  #   sequence(:email) { |n| "TEST#{n}@example.com"}
  #   password { 'password' }
  # end

  # factory :admin, class: User do
  #   sequence(:name) { |n| "TEST_NAME#{n}"}
  #   sequence(:email) { |n| "TEST#{n}@example.com"}
  #   password { 'password' }
  # end
end
