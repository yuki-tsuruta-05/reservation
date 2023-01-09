class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false, defalt: "部屋名なし"
      t.integer :room_id
      t.string :room_introducution
      t.integer :charge, null: false
      t.string :address, null: false
      

      t.timestamps
    end
  end
end
