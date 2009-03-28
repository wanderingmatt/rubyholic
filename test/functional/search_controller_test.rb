require 'test_helper'
require 'flexmock/test_unit'
require 'mocks/test/view_helpers'

class SearchControllerTest < ActionController::TestCase
  
  fixtures :all
  
  test "should search events" do    
    flexmock(Location).should_receive(:search).once.with_any_args.and_return([locations(:one)])
    flexmock(Event).should_receive(:search).once.with_any_args.and_return([events(:one)])
      
    get :index, :q => 'hello world'
    assert_response :success
    
    assert_match '<p>There is 1 result for "hello world"</p>', @response.body
  end
  
  test "get with no query paramter searches everything" do
    flexmock(Location).should_receive(:search).once.with_any_args.and_return([locations(:one)])
    flexmock(Event).should_receive(:search).once.with_any_args.and_return([events(:one)])

    get :index
    assert_response :success
    assert_match 'There is 1 result for ""</p>', @response.body
  end
end
