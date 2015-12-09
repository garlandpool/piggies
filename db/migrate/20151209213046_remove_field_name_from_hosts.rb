class RemoveFieldNameFromHosts < ActiveRecord::Migration
  def change
    remove_column :hosts, :artist_id, :integer
  end
end
