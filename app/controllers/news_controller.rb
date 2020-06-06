class NewsController < ApplicationController
  # before_action :authorize_request, except: [:search_news]

  def headline_news
    @response = newsapi.get_top_headlines(country: 'in')
    if @response.present?
      render json: @response, status: :ok
    else
      render json: {message: "Error while fetching news."}, status: :not_found
    end
  end

  def search_news
    @search_query = search_params
    @response = newsapi.get_everything(country: 'in', q: @search_query[:search_key])
    if @response.present?
      render json: @response, status: :ok
    else
      render json: {message: "Error while fetching news."}, status: :not_found
    end
  end
  
  def list_available_categories
    @category_list = %w(business entertainment general health science sports technology)
    render json: @category_list, status: :ok
  end

  def search_new_based_on_category
    @search_query = search_params
    @response = newsapi.get_top_headlines(country: 'in', q: @search_query[:search_key], category: @search_query[:category])
    if @response.present?
      render json: @response, status: :ok
    else
      render json: {message: "Error while fetching news."}, status: :not_found
    end
  end

  private

  def search_params
    params.permit(:search_key, :category)
  end
end
