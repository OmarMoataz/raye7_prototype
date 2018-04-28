class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.timestamp :departure_time
      t.string :number_seats

      t.timestamps
    end
    add_reference :trips, :users, foreign_key: true, index: true
    add_reference :trips, :source, foreign_key: true, index: true
    add_reference :trips, :destination, foreign_key: true, index: true
  end
end
