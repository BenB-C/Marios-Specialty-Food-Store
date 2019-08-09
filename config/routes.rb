Rails.application.routes.draw do
  get 'landing_page/index'
  root to: 'landing_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :reviews
  end
end
