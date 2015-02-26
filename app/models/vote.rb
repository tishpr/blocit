class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #has_many :comments
end
