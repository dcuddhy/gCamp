class CreateListingTasks < ActiveRecord::Migration
  def change
    create_table :listing_tasks do |t|
      t.string :description

      t.timestamps
    end
  end
end
