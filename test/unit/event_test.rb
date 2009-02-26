require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event validates presence of group" do
    event = Event.new
    assert ! event.valid?
    assert event.errors.on(:group_id)
  end
end
