class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy # is this correct?
  has_many :favorites, dependent: :destroy  
   
  mount_uploader :avatar, AvatarUploader
  
def admin?
 role == 'admin'    
end

def moderator?
 role == 'moderator'
end

def favorited(post)
 favorites.where(post_id: post.id).first
end

def voted(post)
 #post.votes.where(user_id: self).first
 self.votes.where(post_id: post.id).first
end

end