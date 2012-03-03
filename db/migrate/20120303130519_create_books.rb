class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :content_abstract
      t.text :author_abstract
      t.string :author
      t.string :ISBN
      t.string :uploader
      t.date :upload_date

      t.timestamps
    end
  end
end
