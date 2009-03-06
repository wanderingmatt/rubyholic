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
  
  test "sorts fields correctly" do    
    actual = Event.sort(1, 'start_time')
    
    expected = [
      events(:one),
      events(:two),
      events(:three),
      events(:five),
      events(:four)
    ]
    
    expected.each { |e| puts e.start_time }
    
    assert expected == actual
  end
  
  test "sorts related fields correctly" do    
    actual = Event.sort(1, 'groups.name')
    
    expected = [
      events(:three),
      events(:two),
      events(:four),
      events(:five),
      events(:one)
    ]
    
    assert expected == actual
  end
  
  test "time should be formatted properly" do
    assert_equal "Tue 24 Feb, 2009 at 11:45 PM", Event.pretty_time(events(:one).start_time)
  end
end
