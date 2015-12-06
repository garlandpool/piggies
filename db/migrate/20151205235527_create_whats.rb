class CreateWhats < ActiveRecord::Migration
  def change
    create_table :whats do |t|
      t.string :font_awesome
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
