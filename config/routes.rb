Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'
  get 'landing_page/index'
  devise_for :users
  resources :users
  resources :products do
    resources :reviews
  end
end
