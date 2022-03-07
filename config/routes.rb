Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: %i[new create show] do
    resources :orders, only: %i[create]
  end
  resources :orders, only: [:show, :update]
  resources :outfits, only: %i[new create show]

  get '/dashboard/:id', to: 'pages#dashboard', as: :dashboard
  get "/trades", to: "pages#trades"
  resources :chatrooms, only: %i[show] do
    resources :messages, only: :create
  end
end
