class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.column :title, :string
      t.column :url, :text
      t.column :image, :text
      t.column :author, :string
      t.column :started_on, :date
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :books
  end
end
