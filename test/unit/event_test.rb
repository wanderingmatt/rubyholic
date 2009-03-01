require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event validates presence of group" do
    event = Event.new
    assert ! event.valid?
    assert event.errors.on(:group_id)
  end
  
  test "event validates presence of location" do
    event = Event.new
    assert ! event.valid?
    assert event.errors.on(:location_id)
  end
  
  test "event validates presence of start_time" do
    event = Event.new
    assert ! event.valid?
    assert event.errors.on(:start_time)
  end
  
  test "event validates presence of end_time" do
    event = Event.new
    assert ! event.valid?
    assert event.errors.on(:end_time)
  end
  
  test "sort should return the correct order" do    
    actual = Event.sort(1, 'groups.name')
    
    expected = [
      events(:three).id,
      events(:two).id,
      events(:four).id,
      events(:five).id,
      events(:one).id,
      events(:one).id
    ]
    
    assert expected, actual
  end
end
