class AddPivitolTrackerToken < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :pitotal_tracker_token
    end
  end
end
