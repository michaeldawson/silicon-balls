require 'sidekiq/web'

Rails.application.routes.draw do
  get 'pdf/pitch'

  root to: 'home#index'

  get 'contact', to: 'contacts#new'
  resources :contacts, only: :create

  get 'philosophy', to: 'home#philosophy'

  resources :team_members, path: 'team'

  resources :pitches, path: 'pitch', only: [:new, :create] do
    collection do
      get 'thanks'
    end
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'siliconballs' && password == 'balls of silicon, baby'
  end if Rails.env.production?

  mount Sidekiq::Web, at: '/sidekiq'
end
