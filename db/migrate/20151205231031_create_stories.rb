class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :intro
      t.text :body
      t.string :signature
      t.string :status
      t.string :company

      t.timestamps null: false
    end
  end
end
