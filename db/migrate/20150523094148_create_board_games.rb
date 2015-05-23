class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :name, null: false
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.integer :min_age
      t.string :img_small__url
      t.string :img_full_url
      t.integer :object_id
      t.timestamps null: false
    end
  end
end
