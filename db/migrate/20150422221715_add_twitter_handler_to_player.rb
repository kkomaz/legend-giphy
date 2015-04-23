class AddTwitterHandlerToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :twitter_name, :string
  end
end
