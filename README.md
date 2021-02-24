# GOAL

This is a demo to show-case how to implement the display of the unavailable dates with flatpickr.

This demo was created from [this demo](https://github.com/andrerferrer/booking-logic-improved-demo#goal).

Some things were changed to make the example simpler.

The reviews logic was removed and the form was sent to the show page of the restaurant.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

So, let's get it on. We need to disable the dates with [flatpickr](https://flatpickr.js.org/examples#disabling-dates).

## What needs to be done? 

### We need to find the unavailable dates

To do that, we created this method:
```ruby
  # app/models/restaurant.rb
  def unavailable_dates
    bookings.pluck(:start_on, :end_on).map do |range|
      { from: range[0], to: range[1] }
    end
  end
```

### Display these unavailable dates on the View (so that we can work with it using Javascript later)

Add the dataset to the form:

```erb
  <!-- app/views/restaurants/show.html.erb -->
  <%= simple_form_for [@restaurant, @booking], data: { unavailable_dates: @restaurant.unavailable_dates.to_json } do |f| %>
```

### Grab this data with javascript

```js
const initFlatpickr = () => {
  const newBookingForm = document.getElementById('new_booking');
  if (newBookingForm) {
    flatpickr(".datepicker", {
      minDate: 'today',
      altInput: true,
      dateFormat: "Y-m-d",
      disable: JSON.parse(newBookingForm.dataset.unavailableDates) // add this one!
    });
  }
};
```



And we're good to go

Good Luck 🍀 and Have Fun 🤓

Sources:
https://flatpickr.js.org/examples#disabling-dates
https://medium.com/lightthefuse/ruby-on-rails-date-validation-in-a-booking-and-disabling-dates-in-date-picker-3e5b4e9b4640
https://medium.com/@sonia.montero/date-validations-and-flatpickr-setup-for-rails-24c78d6eb784
