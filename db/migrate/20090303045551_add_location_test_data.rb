class AddLocationTestData < ActiveRecord::Migration
  def self.up
    Location.delete_all
    Location.create(
      :name => 'Vivace',
      :address => '532 Broadway Ave East, Seattle, WA 98122'
    )
    Location.create(
      :name => 'Vivace: 24 Alley',
      :address => '227 Yale Ave N Seattle, WA 98109'
    )
    Location.create(
      :name => 'Caffe Ladro',
      :address => '108 Union St, Seattle, WA‎98101'
    )
    Location.create(
      :name => 'Onehub',
      :address => '3380 146th Pl SE, Bellevue, WA 98007'
    )
    Location.create(
      :name => 'Caffe Ladro',
      :address => '10th Ave NE, Issaquah, WA 98029'
    )
    Location.create(
      :name => 'Epic Cafe',
      :address => '745 N 4th Ave, Tucson, AZ 85705'
    )
    Location.create(
      :name => 'Coffee Plantation',
      :address => '680 S Mill Ave, Tempe, AZ‎85281'
    )
    Location.create(
      :name => 'Ikes Coffee and Tea',
      :address => '3400 E Speedway Blvd, Tucson, AZ 85716'
    )
    Location.create(
      :name => 'Coffee X Change',
      :address => '2443 N Campbell Ave, Tucson, AZ 85719'
    )
    Location.create(
      :name => 'Xavier Institute for Higher Learning',
      :address => '252 June Rd, North Salem, NY 10560'
    )
    Location.create(
      :name => 'X-Mansion Basement',
      :address => '252 June Rd, North Salem, NY 10560'
    )
    Location.create(
      :name => 'X-Mansion Backyard',
      :address => '11 W 53rd St, New York, NY 10019'
    )
    Location.create(
      :name => 'X-Jet',
      :address => '276 Titicus Rd, North Salem, NY 10560'
    )
    Location.create(
      :name => 'Cerebro',
      :address => '276 Titicus Rd, North Salem, NY 10560'
    )
    Location.create(
      :name => 'Starbucks',
      :address => '10 Union Sq E, New York, NY 10003'
    )
    Location.create(
      :name => 'The White House',
      :address => '1600 Pennsylvania Ave NW, Washington, DC 20500'
    )
  end

  def self.down
    Location.delete_all
  end
end
