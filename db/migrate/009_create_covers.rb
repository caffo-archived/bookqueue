class CreateCovers < ActiveRecord::Migration
  def self.up
    create_table :covers do |t|
      t.column :content_type, :string
      t.column :size,         :integer
      t.column :filename,     :string
      t.column :data,         :binary
      t.column :db_file_id,   :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :covers
  end
end
