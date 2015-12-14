class AddUserIdToZipcode < ActiveRecord::Migration
  def change
    add_column :zipcodes, :user_id, :integer
  end
end
