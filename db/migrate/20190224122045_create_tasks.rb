class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, comment: 'タスクを管理するためのテーブル' do |t|
      t.string :name, null: false, comment: 'タスクの名称'
      t.text :description, comment: 'タスクの詳しい詳細'

      t.timestamps
    end
  end
end
