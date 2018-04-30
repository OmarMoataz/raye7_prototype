class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.timestamp :departure_time
      t.string :number_seats

      t.timestamps
    end
    add_reference :trips, :users, index: true
    add_reference :trips, :source, index: true
    add_reference :trips, :destination, index: true
  end
end
