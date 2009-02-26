class RemoveFkGroupLocations < ActiveRecord::Migration
  def self.up
    remove_column :groups, :location_id
  end

  def self.down
    add_column :groups, :location_id, :integer
  end
end
