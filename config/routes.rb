Rails.application.routes.draw do
  root to: 'home#index'

  get 'contact', to: 'contacts#new'
  resources :contacts, only: :create

  get 'philosophy', to: 'home#philosophy'

  resource :application, only: :show, path: 'apply' do
    collection do
      resource :investors, only: [:show, :create]
      resource :entrepreneurs, only: [:show, :create]
    end
  end
end
