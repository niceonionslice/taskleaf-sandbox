class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  # def change は 利用しない
  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
