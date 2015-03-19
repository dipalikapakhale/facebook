class FriendshipsController < ApplicationController
  #before_filter :login_required, :except => [:index]
  
  def index
    if params[:find_friend_string].present?
      @users = User.where(email: params[:find_friend_string])
    else
      @users = User.includes(:friendships)
    end
    @user = current_user
    @friendship = Friendship.where(friend_id: current_user.id)
     
  end

 
  
  def create
      @friendship = current_user.friendships.new(:friend_id => params[:friend_id], status: 'pending')
      @friendship.save!
      redirect_to friendships_url
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end


  def accepted_friends
     @friendship = friendship.find(params[:id])
     @friendship.update(status: "accepted")
    redirect_to friendships_path
  end

  def rejected_friends
     @friendship = Friendship.find(params[:id])
     @friendship.update(status: "rejected")
    redirect_to friendships_path
  end 

   
end