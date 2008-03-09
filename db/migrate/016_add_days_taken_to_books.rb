class AddDaysTakenToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :days_taken, :integer
  end

  def self.down
    remove_column :books, :days_taken
  end
end
