require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "location validates presence of name" do
    location = Location.new
    assert ! location.valid?
    assert location.errors.on(:name)
  end
  
  test "location validates presence of address" do
    location = Location.new
    assert ! location.valid?
    assert location.errors.on(:address)
  end
end
