class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :event, index: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.timestamps null: false
    end
  end
end
