class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  #try this from www.railstutorial.org/book/user_microposts
  default_scope -> { order(created_at: :desc) }
  #validates :user_id, presence: true
end
