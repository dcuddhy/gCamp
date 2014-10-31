class AddDefaultToTasksComplete < ActiveRecord::Migration
  def change
    change_column_default :tasks, :complete, false
    execute "update tasks set complete = false where complete is null"
    change_column_null :tasks, :complete, false
  end
end
