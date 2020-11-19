class Booking < ApplicationRecord
  belongs_to :restaurant
  # https://guides.rubyonrails.org/active_record_validations.html#custom-methods
  validates :start_on, presence: true
  validates :end_on, presence: true

  validate :other_booking_overlap, on: [:create, :update]
  
  def period
    start_on..end_on
  end

  private

  def other_booking_overlap
    # run this validation if the other ones did pass
    if errors.blank?
      other_bookings = restaurant.bookings
      overlapping_bookings = other_bookings.select do |other_booking|
        period.overlaps?(other_booking.period)
      end
      is_overlapping = !overlapping_bookings.empty?
      errors.add(:base, "Picked date is not available") if is_overlapping
    end
  end
end
