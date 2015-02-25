class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :value
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
