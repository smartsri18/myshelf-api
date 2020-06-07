class UsersController < ApplicationController
  before_action :authorize_request, except: [:create, :index, :show]
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

  def show
    render json: @user, status: :ok
  end

  private

  def find_user
    begin
      @user = User.find_by!(id: params[:id])
    rescue ActiveRecord::RecordNotFound  => e
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  def user_params
    params.permit(
       :first_name, :last_name, :email, :password, :password_confirmation, :image_url
    )
  end
end
