class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  default_scope -> { order('created_at DESC')  }
  
end
