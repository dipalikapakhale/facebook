class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /image/

#has_many :friendships, :dependent => :destroy
#has_many :pending_friends,  -> {where(status: 'pending')}, through: :friendships
#has_many :requested_friends, -> {where(status: 'requested')},through: :friendships
#has_many :accepted_friends, -> { where(status: 'accepted') }, through: :friendships
#has_many :rejected_friends, -> { where(status: 'rejected') }, through: :friendships
has_many :friendships  
has_many :friends, :through => :friendships 
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
has_many :inverse_friends, :through => :inverse_friendships, :source => :user  

has_many :masseges


end




