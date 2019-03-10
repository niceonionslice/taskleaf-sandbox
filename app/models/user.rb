class User < ApplicationRecord
  has_secure_password
  # ↑ これを足すと、データベースのカラムに対応してしない属性を２つ足すことができます。
  # １つ目は、passwordです。password属性は、ユーザーが入力した生のパスワードを一時的に格納するための属性です。
  # ２つ目は、password_confirmationです。（再確認用です。）



  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
