class Topic < ActiveRecord::Base
    has_many :posts,  dependent: :destroy   #reflects association between topics and posts
    belongs_to :user
     # scope :visible_to, -> { where(public: true) }
       scope :visible_to, -> (user) { user ? all : where(public: true) }
end
