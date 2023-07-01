class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :title
      t.text :room_introduction
      t.text :body
      t.integer :price
      t.string :adress
      t.string :room_image_id

      t.timestamps
    end
  end
end
