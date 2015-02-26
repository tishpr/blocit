class CreateVotes < ActiveRecord::Migration


def change
  unless table_exists? :votes
    create_table :votes do |t|
      t.string :value
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
