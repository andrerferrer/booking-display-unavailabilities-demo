puts "Create some Restaurants"

[
  { name: "Amareleen" },
  { name: "Verdeen" }
].each(&Restaurant.method(:create!))

# To help with seeding date and datetimes
# https://stackoverflow.com/questions/5474164/rails-seeding-database-data-and-date-formats
Booking.create! start_on: Date.tomorrow.noon, end_on: 2.days.from_now, restaurant: Restaurant.last

puts "Let's drink a beer"
puts %{
  .~~~~.
  i====i_
  |cccc|_)
  |cccc|
  `-==-'

}

puts "Done!"
