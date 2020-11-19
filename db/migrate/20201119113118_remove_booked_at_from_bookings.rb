class RemoveBookedAtFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :booked_at, :string
  end
end
