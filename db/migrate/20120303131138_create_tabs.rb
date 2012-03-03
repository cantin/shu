class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :name

      t.timestamps
    end
  end
end
