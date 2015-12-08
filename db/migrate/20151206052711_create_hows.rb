class CreateHows < ActiveRecord::Migration
  def change
    create_table :hows do |t|
      t.string :symbol
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
