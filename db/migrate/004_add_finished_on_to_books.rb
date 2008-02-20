class AddFinishedOnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :finished_on, :date
  end

  def self.down
    remove_column :books, :finished_on
  end
end
