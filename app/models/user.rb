class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy # is this correct?
  has_many :favorites, dependent: :destroy  
   
  mount_uploader :avatar, AvatarUploader
                  # has_secure_password -- when will I use this? fr:www.railstutorial.org/book/modeling_users

  #Authorization Checkpoint - does the user have the role ____?
 def admin?
   role == 'admin'    
 end
 
 def moderator?
   role == 'moderator'
 end
 
  def favorited(post)
   favorites.where(post_id: post.id).first
  end

end