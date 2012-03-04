class CreateCommets < ActiveRecord::Migration
  def change
    create_table :commets do |t|
      t.text :commet

      t.timestamps
    end
  end
end
