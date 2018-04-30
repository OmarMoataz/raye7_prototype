class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.timestamp :departure_time

      t.timestamps
    end
    add_reference :pickups, :user, index: true
    add_reference :pickups, :source, index: true
    add_reference :pickups, :destination, index: true
  end
end
