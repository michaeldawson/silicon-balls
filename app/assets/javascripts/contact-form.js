$(document).on('turbolinks:load', function() {
  $('#new_contact input').on('focus', function() {
    $('.alert').remove();
  })
})
