class AddPagesToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :pages, :integer
  end

  def self.down
    remove_column :books, :pages
  end
end
