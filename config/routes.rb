Rails.application.routes.draw do
  root to: 'home#index'

  get 'contact', to: 'contacts#new'
  resources :contacts, only: :create

  get 'philosophy', to: 'home#philosophy'

  resources :pitches, path: 'pitch', only: [:new, :create] do
    collection do
      get 'thanks'
    end
  end
end
