class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.string :area_image_id

      t.timestamps
    end
  end
end
