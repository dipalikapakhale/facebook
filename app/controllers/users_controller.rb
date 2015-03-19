class UsersController < ApplicationController

  before_action :authenticate_user!
  

  def index

    if params[:find_friend_string].present?
      @users = User.where(email: params[:find_friend_string])
    else
      @users = User.includes(:friendships)
    end
    @user = current_user
  end


  def edit
    @user = User.find(params[:id])
   end

 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end


private
  
  def user_params
    params.require(:user).permit!
  end
end

