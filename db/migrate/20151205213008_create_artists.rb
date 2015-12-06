class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first
      t.string :last
      t.string :title
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :bday
      t.integer :bmonth
      t.integer :byear
      t.string :homephone
      t.string :cellphone
      t.string :officephone
      t.integer :zipareas
      t.integer :contract_day
      t.integer :contract_month
      t.integer :contract_year

      t.timestamps null: false
    end
  end
end
