class AddTopicIdToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |table|
      table.references :topic
    end
  end
end
