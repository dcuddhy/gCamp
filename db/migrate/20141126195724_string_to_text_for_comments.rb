class StringToTextForComments < ActiveRecord::Migration
  def change
    change_column :comments, :details, :text
  end
end
