class RenameGameObjectIdToGameId < ActiveRecord::Migration
  def change
    rename_column :board_games, :object_id, :game_id
  end
end
