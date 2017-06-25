//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require lib/plugins
//= require lib/jquery-ui-widget
//= require lib/jquery.backgroundparallax.min
//= require lib/script
//= require_tree .

$(window).load(function() {
  $('html').addClass('loaded');
  setTimeout(function() {
    $('html').addClass('loading-end')
  }, 1900)
})
