class CreateUsersIi < ActiveRecord::Migration
  def change
    create_table :users_iis do |t|
      t.string :email
      t.string :password_digest
    end
  end
end
