$(document).on("turbolinks:before-visit", function(event) {
  $('#header').removeClass('menu-is-open');
})
