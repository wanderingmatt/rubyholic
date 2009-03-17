require 'test_helper'
require 'flexmock/test_unit'
require 'mocks/test/view_helpers'

class SearchControllerTest < ActionController::TestCase
  
  fixtures :all
  
  test "should search Groups" do
    results = flexmock(Event)
    results.should_receive(:search).once.with('hello world', {:page => 1}).and_return(
      [events(:one)]
    )
  
    get :index, :q => 'hello world'
  end
  
  test "get with no query paramter calls find_all)" do
    flexmock(Event).should_receive(:search).once.and_return(
      [events(:one)]
    )
    get :index
    assert_response :success
  end
end
