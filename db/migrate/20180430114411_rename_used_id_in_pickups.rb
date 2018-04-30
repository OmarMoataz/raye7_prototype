class RenameUsedIdInPickups < ActiveRecord::Migration[5.2]
  def change
    rename_column :pickups, :user_id, :passenger_id
  end
end
