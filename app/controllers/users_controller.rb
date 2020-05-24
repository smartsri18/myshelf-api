class UsersController < ApplicationController
  before_action :authorize_request, except: [:create, :index]
  before_action :find_user, except: %i[create index]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by(params[:_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
       :first_name, :last_name, :email, :password, :password_confirmation, :image_url
    )
  end
end
