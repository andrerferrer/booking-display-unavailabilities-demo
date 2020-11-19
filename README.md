# GOAL

This is a demo to show-case how to implement an easy date picker in rails using the `simple form` gem.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## TLDR
```erb
<%= f.input :a_date, as: :date, html5: true %>
<%= f.input :a_date, as: :datetime, html5: true %>
```

## What needs to be done?

- `yarn add flatpickr`

- have a model with the date

eg.: `rails g model booking restaurant:references booked_at:datetime`

- create the form:

```erb
  <h2>Create a new booking</h2>
  <%= simple_form_for Booking.new do |f| %>
    <%= f.input :booked_at, as: :datetime, html5: true %>

    <%# It would work as date as well! %>
    <%# f.input :booked_at, as: :date %>
    
    <%= f.association :restaurant %>
    <%= f.submit %>
  <% end %>
```

- create the javascript init plugin file `app/javascript/plugins/init_flatpickr.js`:

```js
import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {});
};

export { initFlatpickr };
```

- add some css `app/assets/stylesheets/application.scss`:
```scss
@import "flatpickr/dist/flatpickr";
```

- import and use it `app/javascript/packs/application.js`:
```js
// Internal imports, e.g:
import { initFlatpickr } from '../plugins/init_flatpickr';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initFlatpickr();
});
```

- adjust the input in the form `app/views/bookings/index.html.erb` :
```erb
    <%= f.input :booked_at, as: :string, input_html: {class: "datepicker"} %>
```

And we're good to go

Good Luck 🍀 and Have Fun 🤓
