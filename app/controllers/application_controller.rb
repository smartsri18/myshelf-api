class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'Not found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header.present?
    begin
      @decoded = Auth.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def newsapi
    News.new(Rails.application.credentials.news_api[:api_key])
  end
end
