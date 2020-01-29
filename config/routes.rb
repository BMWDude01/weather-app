Rails.application.routes.draw do
  get 'cities/new'
  get 'cities/index'
  get 'cities/show'
  devise_for :users
  root 'dashboard#index'
end
