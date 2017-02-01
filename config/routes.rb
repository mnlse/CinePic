Rails.application.routes.draw do
  resources :main_pages
  root to: 'main_pages#index'
end
