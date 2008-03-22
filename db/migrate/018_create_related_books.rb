class CreateRelatedBooks < ActiveRecord::Migration
  def self.up
    create_table :related_books do |t|
      t.column :book_id, :integer
      t.column :related_id, :integer
    end
  end

  def self.down
    drop_table :related_books    
  end
end
