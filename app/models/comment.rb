class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  default_scope -> { order('created_at DESC')  }
     after_create :send_favorite_emails
 
   private
 
   def send_favorite_emails
     post.favorites.each do |favorite|
       FavoriteMailer.new_comment(favorite.user, post, self).deliver
     end
   end
  
end
