Rails.application.routes.draw do
  devise_for :users
  get 'users/:id', to: 'users#show', as: :users
  patch 'users/:id', to: 'users#edit', as: :user
  resources :articles do
    resources :comments
  end
  get '/articles/approve/:id', to: 'article#approve', as: :approve_article

  resources :people
  resources :movies do
    resources :ratings
  end

  get '/cpanel/users', to: 'cpanel#users', as: :cpanel_users
  get '/cpanel/articles', to: 'cpanel#articles', as: :cpanel_articles
  get '/cpanel/slideshow', to: 'cpanel#slideshow', as: :cpanel_slideshow
  get '/cpanel/people', to: 'cpanel#people', as: :cpanel_people
  get '/cpanel/other', to: 'cpanel#other', as: :cpanel_other
  get '/cpanel/trivia', to: 'cpanel#trivia', as: :cpanel_trivia
  get '/people_movies/new', to: 'movies#new_person', as: :new_people_movies
  get '/json/get_slideshow_imgs', to: 'json#get_slideshow_imgs'
  get '/json/autocomplete_search', to: 'json#autocomplete_search'
  get 'json/get_articles', to: 'json#get_articles'
  get '/slideshow_pics/panel', to: 'slideshow_pics#panel'
  resources :slideshow_pics
  get '/front_page', to: 'main_pages#front_page'
  get '/discover', to: 'main_pages#discover_page'
  get '/learn', to: 'main_pages#learn_page'
  get '/discuss', to: 'main_pages#discuss_page'
  get '/cpanel', to: 'cpanel#show'
  root to: redirect('/front_page') 
end
