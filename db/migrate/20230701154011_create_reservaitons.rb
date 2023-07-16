class CreateReservaitons < ActiveRecord::Migration[6.1]
  def change
    create_table :reservaitons do |t|
      t.date :check_in
      t.date :check_out
      t.integer :people_number
      t.integer :days
      t.integer :sum_price
      t.datetime :reserved_at
      t.integer :user_id
      t.integer :room_id
      t.integer :payment

      t.timestamps
    end
  end
end
