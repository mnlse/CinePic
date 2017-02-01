Rails.application.routes.draw do
  devise_for :users
  resources :main_pages
  root to: 'main_pages#index'
end
