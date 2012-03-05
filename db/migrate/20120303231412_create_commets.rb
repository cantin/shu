class CreateCommets < ActiveRecord::Migration
  def change
    create_table :commets do |t|
      t.text :commet
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end
