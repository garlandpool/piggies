class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :integer
    add_column :users, :title, :string
    add_column :users, :contract_date, :date
    add_column :users, :b_day, :date
    add_column :users, :h_phone, :string
    add_column :users, :c_phone, :string
  end
end
