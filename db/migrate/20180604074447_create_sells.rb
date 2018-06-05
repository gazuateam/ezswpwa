class CreateSells < ActiveRecord::Migration[5.1]
  def change
    create_table :sells do |t|
      t.string :dininghall
      t.timestamps
    end
  end
end
