class AddThumbRelatedFields < ActiveRecord::Migration
  def self.up
    add_column :covers, :thumbnail, :string
    add_column :covers, :parent_id, :integer
  end

  def self.down
    remove_column :covers, :thumbnail
    remove_column :covers, :parent_id
  end
end
