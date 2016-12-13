Rails.application.routes.draw do
  root to: 'home#index'

  get 'contact', to: 'contacts#new'
  resources :contacts, only: :create

  get 'philosophy', to: 'home#philosophy'

  resources :applications, only: [:new, :index] do
    collection do
      get 'investors'
    end
  end
end
