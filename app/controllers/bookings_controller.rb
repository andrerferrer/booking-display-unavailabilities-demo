class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # have an empty booking for the form
    @booking = Booking.new
  end

  def create
    
    @booking = Booking.new(strong_params)
    if @booking.save 
      redirect_to(bookings_path) 
    else 
      # find all bookings to render index
      @bookings = Booking.all
      render(:index)
    end
  end

  private

  def strong_params
    params.require(:booking).permit(:start_on, :end_on, :restaurant_id)
  end

end
