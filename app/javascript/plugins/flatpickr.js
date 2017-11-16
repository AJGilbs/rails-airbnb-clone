import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

if (document.querySelector('.datepicker-range') != null) {
  flatpickr(".datepicker-range", {
    altInput: true,
    allowInput: true,
    mode: 'range'
  })
}

if (document.querySelector('.datepicker') != null) {
  const startDate = document.getElementById('foodTourStartDate').value;
  const endDate = document.getElementById('foodTourEndDate').value;
  console.log(startDate);
  console.log(endDate);
  debugger

  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    minDate: startDate,
    maxDate: endDate
  });
}

