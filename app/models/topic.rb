class Topic < ActiveRecord::Base
    has_many :posts,  dependent: :destroy   #reflects association between topics and posts
    belongs_to :user
      
       scope :visible_to, -> (user) { user ? all : publicly_viewable }
       scope :publicly_viewable, -> { where(public: true) }
        scope :privately_viewable, -> { where(public: false) } 
    
       # So this scope returns the equivalent of topic_collection.all or
       # topic_collection.where(public: true), depending on the value of user.
end



          
      