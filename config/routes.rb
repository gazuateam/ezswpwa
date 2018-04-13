Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  get 'main/home'
  root "main#home"

  # posts controller
  get 'posts/new' => 'posts#new'
  get 'posts/create' => 'posts#create'

  get 'posts/index' => 'posts#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
