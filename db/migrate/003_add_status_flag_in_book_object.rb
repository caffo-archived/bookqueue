class AddStatusFlagInBookObject < ActiveRecord::Migration
  def self.up
    add_column :books, :status, :integer, :default => '0'
  end

  def self.down
    remove_column :books, :status
  end
end
