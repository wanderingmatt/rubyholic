require 'test_helper'
require 'flexmock/test_unit'
require 'mocks/test/view_helpers'

class SearchControllerTest < ActionController::TestCase
  
  fixtures :all
  
  test "should search events" do
    puts "35 YEARS AGO: #{Time.parse(35.years.ago.strftime('%a, %d %b %Y %H:%M:%S %Z %z'))}"
    puts "TIME NOW: #{Time.now}"
    # flexmock(Location).should_receive(:search).once.with("hello world")
    
    flexmock(Event).should_receive(:search).once.with('hello world', {
      :per_page => 10,
      :order => "date ASC",
      :without => { :start_time => (Time.parse(35.years.ago.strftime('%a, %d %b %Y %H:%M:%S %Z %z')))..(Time.now) },
      # :geo => [0.0174532925199433, 0.0174532925199433],
      :page => 1
    }).and_return([events(:one)])
      
    get :index, :q => 'hello world'
    
  end
  
  test "get with no query paramter searches everything" do
    # flexmock(Group).should_receive(:search).once.and_return([groups(:one)])
    # flexmock(Location).should_receive(:search).once.and_return([locations(:one)])
    # flexmock(Event).should_receive(:search).once.and_return([events(:one)])
    # get :index
    # assert_response :success
  end
end
