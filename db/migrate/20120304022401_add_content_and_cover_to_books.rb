class AddContentAndCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :content, :string

    add_column :books, :cover, :string
  end
end
