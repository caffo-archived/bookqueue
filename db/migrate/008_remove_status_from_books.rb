class RemoveStatusFromBooks < ActiveRecord::Migration
  def self.up
    remove_column :books, :status
  end

  def self.down
    add_column :books, :status, :integer, :default => '0'
  end
end
