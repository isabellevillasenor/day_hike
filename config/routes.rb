Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trails, only: [:index, :show]
  resources :trips, only: [:index, :show]
end
