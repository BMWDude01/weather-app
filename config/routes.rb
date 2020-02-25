Rails.application.routes.draw do
  resources :cities, only: %w[new index show create]
  devise_for :users
  root 'cities#all_cities'
end
