class RemoveArtistIdFromZipcodes < ActiveRecord::Migration
  def change
    remove_column :zipcodes, :artist_id, :integer
  end
end
