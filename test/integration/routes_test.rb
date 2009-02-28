require 'test_helper'

class RoutesTest < ActionController::IntegrationTest
  fixtures :all

  test "root should get event index" do
    get '/'
    root_body = @response.body
    get '/events'
    events_body = @response.body
    
    assert_equal root_body, events_body    
  end

end
