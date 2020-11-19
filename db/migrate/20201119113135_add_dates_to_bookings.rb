class AddDatesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_on, :date
    add_column :bookings, :end_on, :date
  end
end
