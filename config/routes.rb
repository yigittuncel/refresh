Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :items, only: [:show]
=======
  resources :items, only: %i[new create]
>>>>>>> master
end
