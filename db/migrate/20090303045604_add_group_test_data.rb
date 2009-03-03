class AddGroupTestData < ActiveRecord::Migration
  def self.up
    Group.delete_all
    Group.create ( :name => "X-Men" )
    Group.create ( :name => "Brotherhood of Mutants" )
    Group.create ( :name => "Weapon X" )
    Group.create ( :name => "The Avengers" )
    Group.create ( :name => "Alpha Flight" )
    Group.create ( :name => "Horsemen of Apocalypse" )
    Group.create ( :name => "S.H.I.E.L.D." )
    Group.create ( :name => "The Morlocks" )
    Group.create ( :name => "Acolytes" )
    Group.create ( :name => "Marauders" )
    Group.create ( :name => "Hellfire Club" )
    Group.create ( :name => "The Marauders" )
    Group.create ( :name => "Excalibur" )
    Group.create ( :name => "Generation X" )
    Group.create ( :name => "The Twelve" )
  end

  def self.down
    Group.delete_all
  end
end
