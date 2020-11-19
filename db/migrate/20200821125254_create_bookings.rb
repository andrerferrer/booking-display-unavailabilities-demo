class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :booked_at

      t.timestamps
    end
  end
end
