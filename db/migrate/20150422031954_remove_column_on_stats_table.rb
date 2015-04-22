class RemoveColumnOnStatsTable < ActiveRecord::Migration
  def change
    remove_column :stats, :key_id
  end
end
