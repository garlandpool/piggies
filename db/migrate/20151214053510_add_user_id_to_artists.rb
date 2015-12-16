class AddUserIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :user_id, :integer
    add_index :artists, :user_id
  end
end
