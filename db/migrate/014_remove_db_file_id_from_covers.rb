class RemoveDbFileIdFromCovers < ActiveRecord::Migration
  def self.up
    remove_column :covers, :db_file_id
  end

  def self.down
    add_column :db_file_id,   :integer
  end
end
