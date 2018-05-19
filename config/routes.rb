Rails.application.routes.draw do
  get 'main/buyerinput'

  get 'main/dininghall'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  get 'main/home'=> 'main#home'
  root "main#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
