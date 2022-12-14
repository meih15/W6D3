# app/controllers/users_controller.rb

class UsersController < ApplicationController

  def index
    render plain: "I'm in the index action!"
  end

  def create
    render json: params
  end
  
  def show
    render json: params
  end

def create
  user = User.new(params.require(:user).permit(:name, :email))
  if user.save
    render json: user
  else
    render json: user.errors.full_messages, status: :unprocessable_entity
  end
end

def show
  @user = User.find(params[:id])
  render json: @user
end

def update
  @user = User.find(params[:id])

  @user.update(user_params)
    redirect_to user_url(@user)
  else 
    render json: @user.errors.full_messages, status: :unprocessable_entity 
  end
  
end

def destroy 
  @user = User.find(params[:id])

  @user.destroy 
  redirect_to users_url
end

  private 
  def user_params 
    params.require(:user).permit(:name, :email)
  end

end