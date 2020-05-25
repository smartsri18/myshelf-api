Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, params: :_id
  post 'auth/login', to: "authentication#login"
  get 'search/movie', to: "my_movies#search_movie"
  post 'add/movie', to: "my_movies#add_to_my_movies"
  get 'list/movie', to: "my_movies#list_movies"
end
