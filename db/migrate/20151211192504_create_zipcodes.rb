class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.integer :zip
      t.integer :artist_id
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
