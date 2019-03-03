class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: "名前"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワードダイジェスト"

      t.timestamps
      t.index :email, unique: true
    end
  end
end
