# GOAL

This is a demo to show-case how to implement booking logic according to the available dates.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## What needs to be done?

### We need a custom validation on `app/models/booking.rb`:
```ruby
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
```

---

And we're good to go

Good Luck 🍀 and Have Fun 🤓
