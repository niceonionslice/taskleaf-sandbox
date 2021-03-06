class User < ApplicationRecord
  has_many :tasks
  has_secure_password

  # 検証
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
