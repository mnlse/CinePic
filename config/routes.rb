Rails.application.routes.draw do
  resources :articles
  devise_for :users
  get '/front_page', to: 'main_pages#front_page'
  get '/discover', to: 'main_pages#discover_page'
  get '/learn', to: 'main_pages#learn_page'
  get '/discuss', to: 'main_pages#discuss_page'
  root to: redirect('/front_page') 
end
