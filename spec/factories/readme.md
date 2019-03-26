# FactoryBotについて

FactoryBotとは、テストデータの作成を手伝ってくれるGem
FactoryBotを利用すると簡単にテストデータを作成することができるようになります。

テストデータの定義

spec配下の'factories/{{MODEL}}.rb'ファイルを作成しこの中に定義する。

```rb
FactoryBot.define do
  factory :user do
    name { 'Yamada Tarou' }
    email { 'yamade@rails.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory  :other_user, class: User do
    name { 'Sato jirou' }
    email { 'sato@rails.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
```

利用する場合はこんな感じで利用する
```rb
let(:user) { FactoryBot.create(:user) }
```
