class HomeController < ApplicationController
  configure_layout header: { display_logo: false, menu_class: :white }, only: :index

  def index
  end
end
