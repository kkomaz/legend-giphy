class AddImageAndIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :image, :string
    add_column :characters, :key, :string
  end
end
