class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # have an empty booking for the form
    @booking = Booking.new
  end

  def create
    
    @booking = Booking.new(strong_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking.restaurant = @restaurant
    if @booking.save 
      redirect_to(@restaurant) 
    else 
      render('restaurants/show')
    end
  end

  private

  def strong_params
    params.require(:booking).permit(:start_on, :end_on)
  end

end
