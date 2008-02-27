class AddBookIdToCovers < ActiveRecord::Migration
  def self.up
    add_column :covers, :book_id, :integer
  end

  def self.down
    remove_column :covers, :book_id
  end
end
