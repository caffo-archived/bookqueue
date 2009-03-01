class AddCoverToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :cover_file_name, :string
    add_column :books, :cover_content_type, :string
    add_column :books, :cover_file_size, :integer
  end

  def self.down
  end
end
