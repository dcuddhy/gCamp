class RemameListingTasks < ActiveRecord::Migration
  def change
    rename_table :listing_tasks, :tasks
  end
end
