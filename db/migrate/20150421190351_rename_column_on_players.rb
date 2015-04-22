class RenameColumnOnPlayers < ActiveRecord::Migration
  def change
    rename_column :players, :player_id, :player_key
  end
end
