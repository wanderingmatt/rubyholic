class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :location_id, :null => false, :options => "CONSTRAINT fk_group_locations REFERENCES locations(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
