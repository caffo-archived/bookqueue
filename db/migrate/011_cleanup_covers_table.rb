class CleanupCoversTable < ActiveRecord::Migration
  def self.up
    remove_column :covers, :data
  end

  def self.down
    add_column :covers, :data, :binary
  end
end
