class AddUserToPosts < ActiveRecord::Migration
  def change

    change_table :posts do |t|
      t.string :name
      t.integer :user_id
    end

    add_index :posts, :user_id  # create an index on user_id by adding
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id #:name # create an index on user_id by addin
    # an add_index line in the migration's change method:
    #Indexes help optimize queries with associated attributes,
    # as is the case with querying the posts table for a specific user_id
  end
end
