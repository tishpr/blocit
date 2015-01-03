class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :user
  default_scope { order('created_at DESC') }
  
end
# this is a Post class model   app/models/post.rb
# it goes along with a migration file (begins with a timestamp)
# db/migrate/20141231timeinminhours_create_posts.rb 