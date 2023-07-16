class ChangeReservaitonsToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_table :reservaitons, :reservations
  end
end
