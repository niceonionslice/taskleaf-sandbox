class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    # ユーザーテーブルにadminカラムを追加する型はboolean。デフォルトはfalse 必須項目
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
