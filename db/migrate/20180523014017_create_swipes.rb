class CreateSwipes < ActiveRecord::Migration[5.1]
  def change
    create_table :swipes do |t|
      t.string :dininghall
      t.string :swipes
      t.string :price
      t.string :uid
      t.timestamps
    end
  end
end
