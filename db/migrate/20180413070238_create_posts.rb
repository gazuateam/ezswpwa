class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :location
      t.integer :price
      t.integer :number
      t.integer :status
      t.string :buyer_id
      t.string :buyer_name
      t.string :seller_name

      t.timestamps
    end
  end
end
