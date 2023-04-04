Rails.application.routes.draw do
  root "products#index"
  devise_for :user
  resources :products do
    member do
      get 'checkout'
      get "success" => "products#stripe_success", as: :stripe_success
      get "cancel" => "products#stripe_cancel", as: :stripe_cancel
    end
  end
  get "user_products" => "products#user_products"
  get "my_products" => "products#my_products"
  # resources :checkout, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
