class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :first
      t.string :last
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :h_phone
      t.string :c_phone
      t.boolean :visible
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
