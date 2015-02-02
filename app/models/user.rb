class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
  has_many :comments 
   
  mount_uploader :avatar, AvatarUploader
                  # has_secure_password -- when will I use this? fr:www.railstutorial.org/book/modeling_users

  #Authorization Checkpoint - does the user have the role ____?
 def admin?
   role == 'admin'    
 end
 
 def moderator?
   role == 'moderator'
 end

end