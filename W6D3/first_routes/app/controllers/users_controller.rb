class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
  
    if user.save  
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end 

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end    
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: user
    else
      render json: ["user #{params[:id]} doesn't exist"], status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end 

  def query_exists?
    return false unless request.query_string.present?
  end

end