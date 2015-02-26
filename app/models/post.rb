class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
<<<<<<< HEAD

  has_many :votes, dependent: :destroy

  #has_many :votes, dependent: :destroy  #to enable post.votes  from: votes Checkpoint

=======
  has_many :votes, dependent: :destroy
>>>>>>> votes
  belongs_to :user
  belongs_to :topic  # associates post to Topics
  mount_uploader :image, ImageUploader
  default_scope { order('created_at DESC') }
  
      # from checkpoint Validating Posts 
      # from branch "validating posts"
   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

end
# this is a Post class model   app/models/post.rb
# it goes along with a migration file (begins with a timestamp)
# db/migrate/20141231timeinminhours_create_posts.rb 