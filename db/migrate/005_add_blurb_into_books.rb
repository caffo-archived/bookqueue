class AddBlurbIntoBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :blurb, :text
  end

  def self.down
    remove_column :books, :blurb
  end
end
