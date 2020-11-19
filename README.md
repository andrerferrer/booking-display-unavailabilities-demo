# GOAL

This is a demo to show-case how to implement booking logic according to the available dates with improved SQL.

This demo was created from [this one](https://github.com/andrerferrer/booking-logic-demo#goal).

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## What needs to be done?

### We had this before:
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

But it's very inneficient. We will deserialize lots of data from the DB and we won't use it much.

Therefore, a better solution is to solve the filtering with SQL itself.

The logic here is that we don't have a overlap in these scenarios:

```
                      start_date          end_date
                          |--------------------|
:start_date     :end_date
|-------------------|
```

```
start_date          end_date
    |--------------------|
                           :start_date        :end_date
                              |-------------------|
```

In SQL, this means `:end_date >= start_date and end_date >= :start_date`.

### We need to make it happen in the model, now:
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

Credits go to this [Source](https://railsguides.net/date-ranges-overlap/) and this [StackOverflow Answer](https://stackoverflow.com/questions/3269434/whats-the-most-efficient-way-to-test-two-integer-ranges-for-overlap).