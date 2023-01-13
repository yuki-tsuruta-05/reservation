class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_day, null: false
      t.date :end_day, null: false

      t.timestamps
    end
  end
end
