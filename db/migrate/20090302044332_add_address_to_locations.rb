class AddAddressToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :address, :string
  end

  def self.down
    remove_column :locations, :address
  end
end
