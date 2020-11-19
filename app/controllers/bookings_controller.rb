class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(strong_params)
    @booking.save ? redirect_to(bookings_path) : render(:index)
  end

  private

  def strong_params
    params.require(:booking).permit(:booked_at, :restaurant_id)
  end

end
