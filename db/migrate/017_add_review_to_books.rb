class AddReviewToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :review, :text
  end

  def self.down
    remove_column :books, :review
  end
end
