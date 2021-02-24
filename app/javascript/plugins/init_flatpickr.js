import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const newBookingForm = document.getElementById('new_booking');
  if (newBookingForm) {
    flatpickr(".datepicker", {
      minDate: 'today', // make previous dates unavailable
      altInput: true, // display a user friendlier message
      dateFormat: "Y-m-d",
      disable: JSON.parse(newBookingForm.dataset.unavailableDates)
    });
  }
};

export { initFlatpickr };