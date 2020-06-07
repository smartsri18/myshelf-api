Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, params: :_id
  resources :notes, params: :_id
  post 'auth/login', to: "authentication#login"
  get 'search/movie', to: "my_movies#search_movie"
  post 'add/movie', to: "my_movies#add_to_my_movies"
  get 'list/movie', to: "my_movies#list_movies"
  get 'news/headlines', to: "news#headline_news"
  get 'news/search', to: "news#search_news"
  get 'news/categories', to: "news#list_available_categories"
  get 'news/categories/search', to: "news#search_new_based_on_category"
end