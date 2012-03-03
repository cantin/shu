class CreateBookCommets < ActiveRecord::Migration
  def change
    create_table :book_commets do |t|
      t.text :commet

      t.timestamps
    end
  end
end
