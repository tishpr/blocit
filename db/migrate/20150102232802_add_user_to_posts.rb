class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id, #:name # create an index on user_id by adding
    # an add_index line in the migration's change method:
    #Indexes help optimize queries with associated attributes,
    # as is the case with querying the posts table for a specific user_id
  end
end
