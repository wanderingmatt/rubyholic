require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "group validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end
end
