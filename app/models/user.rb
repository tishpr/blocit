class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
  
end

  #Authorization Checkpoint - does the user have the role ____?
 def admin?
   self.role == 'admin'    # self is implied, but I am including it for my understanding
 end
 
 def moderator?
   self.role == 'moderator'
 end