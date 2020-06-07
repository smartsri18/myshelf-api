class NotesController < ApplicationController
  before_action :authorize_request, except: %i[index]
  before_action :find_user_notes, except: [:create, :index]

  def index
    @notes = MyNote.all
    render json: @notes, status: :ok
  end

  def create
    @note_query = notes_params
    @current_user_notes = @current_user.my_notes.new(description: @note_query[:description])
    if @current_user_notes.save
      render json: {message: "Notes created"}, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    unless @user_notes.update(notes_params)
      render json: { errors: @user_notes.errors.full_messages },
              status: :unprocessable_entity
    end
    render json: @user_notes, status: :ok
  end

  def destroy
    if @user_notes.destroy
      render json: { message: "your notes has been deleted" }, status: :ok
    else  
      render json: { errors: @customer.errors.full_messages },
              status: :unprocessable_entity
    end
  end

  def show
    render json: @user_notes, status: :ok
  end

  private

  def find_user_notes
    begin
      @user_notes = @current_user.my_notes.find_by!(id: params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: 'Notes not found' }, status: :not_found
    end
  end

  def notes_params
    params.permit( :description )
  end
end
