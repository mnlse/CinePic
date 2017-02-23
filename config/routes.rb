Rails.application.routes.draw do
  devise_for :users
  get 'users/:id', to: 'users#show', as: :users
  patch 'users/:id', to: 'users#edit', as: :user
  resources :articles do
    resources :comments
  end

  resources :people
  resources :movies do
    resources :ratings
  end

  get '/json/get_slideshow_imgs', to: 'json#get_slideshow_imgs'
  get '/slideshow_pics/panel', to: 'slideshow_pics#panel'
  resources :slideshow_pics
  get '/front_page', to: 'main_pages#front_page'
  get '/discover', to: 'main_pages#discover_page'
  get '/learn', to: 'main_pages#learn_page'
  get '/discuss', to: 'main_pages#discuss_page'
  get '/cpanel', to: 'cpanel#show'
  root to: redirect('/front_page') 
end
