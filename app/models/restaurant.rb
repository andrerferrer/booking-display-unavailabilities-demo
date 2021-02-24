class Restaurant < ApplicationRecord
  STRONG_PARAMS = %i[
    name
    address
  ]

  has_many :reviews
  has_many :bookings

  def unavailable_dates
    # If you want to read more
    # https://medium.com/lightthefuse/ruby-on-rails-date-validation-in-a-booking-and-disabling-dates-in-date-picker-3e5b4e9b4640
    bookings.pluck(:start_on, :end_on).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
