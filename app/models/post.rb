class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic                           # associates post to Topics
  mount_uploader :image, ImageUploader
  after_create :create_vote

  def up_votes 
    
    votes.where(value: 1).count
  end

  def down_votes 
    
    votes.where(value: -1).count
  end

  def points 
    
    votes.sum(:value)
  end

 def update_rank
   age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
   new_rank = points + age_in_days

   update_attribute(:rank, new_rank)
 end

# default_scope { order('created_at DESC') } ~ orders from most recent first ~
   default_scope { order('rank DESC') } # ordered by rank
    
   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
  
  private

  def create_vote
    user.votes.create
  @post.update && self(value: 1)#post association to equal self + value to equal 1.
  end
end
# this is a Post class model   app/models/post.rb
# it goes along with a migration file (begins with a timestamp)
# db/migrate/20141231timeinminhours_create_posts.rb 