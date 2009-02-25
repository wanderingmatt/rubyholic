require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "group validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end
  
  test "group validates presence of location_id" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:location_id)
  end
end
