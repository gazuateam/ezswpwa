Rails.application.routes.draw do
  get 'homes/select'
  get 'homes/connected'
  get 'homes/waiting'
  get 'homes/seller'
  get 'homes/buyer'
  get 'homes/index' => 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
