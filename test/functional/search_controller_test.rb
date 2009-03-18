require 'test_helper'
require 'flexmock/test_unit'
require 'mocks/test/view_helpers'

class SearchControllerTest < ActionController::TestCase
  
  fixtures :all
  
  test "should search Events" do
    flexmock(Group).should_receive(:search).once.with("hello world").and_return([groups(:one)])
    flexmock(Location).should_receive(:search).once.with("hello world").and_return([locations(:one)])
    flexmock(Event).should_receive(:search).once.with('hello world', {:page => 1}).and_return([events(:one)])
  
    get :index, :q => 'hello world'
  end
  
  test "get with no query paramter searches everything" do
    flexmock(Group).should_receive(:search).once.and_return([groups(:one)])
    flexmock(Location).should_receive(:search).once.and_return([locations(:one)])
    flexmock(Event).should_receive(:search).once.and_return([events(:one)])
    get :index
    assert_response :success
  end
end
