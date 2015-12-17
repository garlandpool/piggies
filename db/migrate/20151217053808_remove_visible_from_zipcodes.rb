class RemoveVisibleFromZipcodes < ActiveRecord::Migration
  def change
    remove_column :zipcodes, :visible, :boolean
    remove_column :zipcodes, :artist_id, :integer
  end
end
