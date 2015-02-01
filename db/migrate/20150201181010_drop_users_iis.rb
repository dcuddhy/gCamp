class DropUsersIis < ActiveRecord::Migration
  def change
    drop_table :users_iis
  end
end
