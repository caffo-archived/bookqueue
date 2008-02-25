class AddStateColumnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :state, :string, :default => 'next'
  end

  def self.down
    remove_column :books, :state
  end
end
