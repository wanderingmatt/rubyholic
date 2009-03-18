class AddDeltas < ActiveRecord::Migration
  def self.up
    add_column :events, :delta, :boolean, :default => false
    add_column :groups, :delta, :boolean, :default => false
    add_column :locations, :delta, :boolean, :default => false
    
    add_index :events, :delta
    add_index :groups, :delta
    add_index :locations, :delta
  end

  def self.down
    remove_column :events, :delta
    remove_column :groups, :delta
    remove_column :locations, :delta
  end
end
