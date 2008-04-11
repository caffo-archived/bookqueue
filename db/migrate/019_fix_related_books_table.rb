class FixRelatedBooksTable < ActiveRecord::Migration
  def self.up
    remove_column :related_books, :id
  end

  def self.down
  end
end
