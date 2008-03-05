class AddRateToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :rate, :integer
  end

  def self.down
    remove_column :books, :rate
  end
end
