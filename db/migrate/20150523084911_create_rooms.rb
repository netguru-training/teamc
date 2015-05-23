class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :city, null: false
      t.string :street, null: false
      t.integer :room_number
      t.timestamps null: false
    end
  end
end
