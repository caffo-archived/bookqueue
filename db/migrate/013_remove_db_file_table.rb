class RemoveDbFileTable < ActiveRecord::Migration
  def self.up
    drop_table :db_files
  end

  def self.down
    create_table :db_files do |t|
      t.column  :data, :binary
      t.timestamps
    end
  end
end
