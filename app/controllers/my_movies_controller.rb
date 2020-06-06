class MyMoviesController < ApplicationController
  before_action :authorize_request, except: [:search_movie]

  def search_movie
    @search_query = search_params
    @request = RestClient.get 'http://www.omdbapi.com/', { params: { apikey: Rails.application.credentials.omdb[:api_key], s: @search_query[:search_movie], plot: 'full' } }
    @response = JSON.parse(@request)
    if @response.present?
      render json: @response, status: :ok
    else
      render json: {message: "No record found"}, status: :not_found
    end
  end

  def get_movie_detailed_view(movie_query)
    @request = RestClient.get 'http://www.omdbapi.com/', { params: { apikey: Rails.application.credentials.omdb[:api_key], i: movie_query, plot: 'full' } }
    @response = JSON.parse(@request)
    if @response.present?
      return @response
    else
      render json: {message: "mismatch imdbID"}, status: :not_found
    end
  end

  def add_to_my_movies
    @movie_info = get_movie_detailed_view(params[:imdbID])
    @movie_info.symbolize_keys!.transform_keys!(&:downcase)
    
    @current_user_movies = @current_user.my_movies.new(title: @movie_info[:title], genre: @movie_info[:title], released_date: @movie_info[:released], categories: :liked)
    if @current_user_movies.save
      @current_movie_img = @current_user_movies.images.create!(image_url: @movie_info[:poster])
      render json: {message: "Your movie added to the my movies collection"}, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def list_movies
    render json: @current_user.my_movies, status: :ok
  end

  private

  def search_params
    params.permit(:search_movie)
  end
end
