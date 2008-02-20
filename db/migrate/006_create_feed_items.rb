class CreateFeedItems < ActiveRecord::Migration
  def self.up
    create_table :feed_items do |t|
      t.column :title,  :string
      t.column :body,   :text
      t.column :link,   :text
      t.column :author, :string
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :feed_items
  end
end
