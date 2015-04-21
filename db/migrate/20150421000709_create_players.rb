class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :player_id

      t.timestamps null: false
    end
  end
end
