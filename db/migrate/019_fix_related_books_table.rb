class FixRelatedBooksTable < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE `related_books` DROP `id`;"
  end

  def self.down
  end
end
