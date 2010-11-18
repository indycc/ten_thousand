$(function() {
  $('.datepicker')
    .datepicker()
    .datepicker('option', 'dateFormat', 'yy-mm-dd')
    .datepicker('setDate', new Date());
});
