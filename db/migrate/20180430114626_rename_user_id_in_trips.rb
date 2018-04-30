class RenameUserIdInTrips < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :user_id, :driver_id
  end
end
