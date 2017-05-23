class HomeController < ApplicationController
  configure_layout body_class: 'balls-background', header: {
    display_logo: false,
    menu_class: :white
  }, footer: { visible: false }, only: :index
end
