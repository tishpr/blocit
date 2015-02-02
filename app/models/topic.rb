class Topic < ActiveRecord::Base
    has_many :posts,  dependent: :destroy
    belongs_to :user        #reflects association between topics and posts
end
