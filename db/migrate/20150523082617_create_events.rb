class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.string :place, null: false
      t.datetime :datetime, null: false
      t.timestamps null: false
    end
  end
end
