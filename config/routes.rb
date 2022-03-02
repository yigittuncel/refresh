Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: %i[new create show]
  resources :outfits, only: %i[new create]
  get "/dashboard", to: "pages#dashboard"
end
