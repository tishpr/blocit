class AddUserToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :user_id, :integer
    add_index :posts, :user_id
    #change_table :posts do |t|
      #t.string :name
      #t.integer :user_id
   
  end
end
