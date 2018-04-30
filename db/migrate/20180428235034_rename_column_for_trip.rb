class RenameColumnForTrip < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :users_id, :user_id
  end
end
