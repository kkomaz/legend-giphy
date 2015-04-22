class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :character_id
      t.integer :key_id
      t.integer :games_won
      t.integer :games_lost
      t.integer :character_kills
      t.integer :character_assists
      t.timestamps null: false
    end
  end
end
