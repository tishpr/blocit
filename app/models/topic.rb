class Topic < ActiveRecord::Base
    has_many :posts  #reflects association between topics and posts
end
