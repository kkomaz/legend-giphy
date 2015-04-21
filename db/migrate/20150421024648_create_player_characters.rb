class CreatePlayerCharacters < ActiveRecord::Migration
  def change
    create_table :player_characters do |t|
      t.integer :player_id
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
