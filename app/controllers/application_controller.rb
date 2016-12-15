class ApplicationController < ActionController::Base
  include Concerns::LayoutOptions

  protect_from_forgery with: :exception

  configure_layout header: { display_logo: true }
end
