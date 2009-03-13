require 'test_helper'
require 'flexmock/test_unit'

class SearchControllerTest < ActionController::TestCase

  fixtures :groups

  test "should search Groups" do
    
    flexmock(Group).should_receive(:search).once.with('hello world', {:page => 1}).and_return(
      [groups(:one)]
    )
    
    
    
    get :index, :q => 'hello world'
  end

  test "get with no query paramter calls find_all)" do
    flexmock(Group).should_receive(:all).once.and_return(
      [groups(:one)]
    )
    get :index
    assert_response :success
  end
end
