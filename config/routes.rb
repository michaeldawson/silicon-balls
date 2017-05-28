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
end
