require 'test_helper'
require 'flexmock/test_unit'

class LocationTest < ActiveSupport::TestCase
  test "location validates presence of name" do
    location = Location.new
    flexmock(location).should_receive(:auto_geocode_address).and_return(true)

    assert ! location.valid?
    assert location.errors.on(:name)
  end
  
  test "location validates presence of address" do
    location = Location.new
    assert ! location.valid?
    assert location.errors.on(:address)
  end

  test "should auto-geocode address" do
    location = Location.create(:name => locations(:one).name, :address => locations(:one).address)
    flexmock(location).should_receive(:auto_geocode_address).and_return(true)
    assert location.valid?
    
    location = locations(:one)
    
    assert_equal locations(:one).latitude, location.latitude
    assert_equal locations(:one).longitude, location.longitude
  end
end
