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

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'siliconballs' && password == 'balls of silicon, baby'
  end if Rails.env.production?

  mount Sidekiq::Web, at: '/sidekiq'
end
