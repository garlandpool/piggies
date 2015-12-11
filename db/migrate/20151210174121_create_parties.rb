class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.datetime :date
      t.integer :duration
      t.boolean :canceled
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
