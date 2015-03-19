class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => 'User',:foreign_key =>'friend_id'


	def self.check_friendship(sender_id, receiver_id)
		where("(user_id=? and friend_id=?) or (friend_id=? and user_id=?)", sender_id, receiver_id, sender_id, receiver_id).first
	end
end