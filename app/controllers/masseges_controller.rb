class MassegesController < ApplicationController

	def index 
       @masseges = Massege.where(friend_id: current_user.id, user_id: params[:friend_id])
       @massege = Massege.new
  end 

    
    
  def create  
    @massege = Massege.create!(massege_params)
    redirect_to masseges_path(friend_id: params[:massege][:friend_id]) 
  end

  
  
 private

 	def massege_params
 		params.require(:massege).permit(:user_id, :friend_id, :body)
 	end
end  