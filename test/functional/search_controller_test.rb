require 'test_helper'
require 'flexmock/test_unit'
require 'mocks/test/view_helpers'

class SearchControllerTest < ActionController::TestCase
  # 
  # fixtures :groups
  # 
  # test "should search Groups" do
  #   results = flexmock(Group)
  #   results.should_receive(:search).once.with('hello world', {:page => 1}).and_return(
  #     [groups(:one)]
  #   )
  # 
  #   get :index, :q => 'hello world'
  # end
  # 
  # test "get with no query paramter calls find_all)" do
  #   flexmock(Group).should_receive(:all).once.and_return(
  #     [groups(:one)]
  #   )
  #   get :index
  #   assert_response :success
  # end
end
