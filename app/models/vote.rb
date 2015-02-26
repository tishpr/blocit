class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
<<<<<<< HEAD
=======
  #has_many :comments
>>>>>>> votes
end
