require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    
    assert_response :success
    assert_not_nil assigns(:events)
  end
  
  test "map renders location from ip" do
    @request.env['REMOTE_ADDR'] = '140.142.222.108'
    
    get :index
    
    assert_response :success
    
    # assert_tag :tag => 'div', :attributes => { :id => 'map' }
    assert_match 'div id="map"', @response.body
    assert_match "GLatLng(47.0597,-122.3623)", @response.body
  end
  
  test "map renders upcoming events" do
    get :index
    
    assert_response :success
    
    assert_no_match /GLatLng\(#{locations(:one).latitude.to_s}\,#{locations(:one).longitude.to_s}\)/, @response.body
    assert_no_match /GLatLng\(#{locations(:two).latitude.to_s}\,#{locations(:two).longitude.to_s}\)/, @response.body
    assert_match "GLatLng(#{locations(:three).latitude},#{locations(:three).longitude})", @response.body
    assert_match "GLatLng(#{locations(:four).latitude},#{locations(:four).longitude})", @response.body
    assert_match "GLatLng(#{locations(:five).latitude},#{locations(:five).longitude})", @response.body
  end

  test "should get new" do
    get :new
    
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, :event => {
        :group_id => groups(:one).id,
        :location_id => locations(:one).id,
        :start_time => 'Sat Jan 01 08:01:00 UTC 2000',
        :end_time => 'Sat Jan 01 08:01:00 UTC 2000',
        }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  # TODO: Need to mock out the Google Maps data
  # TODO: Need to ge this test working again.
  test "should show event" do
    # get :show, :id => events(:one).id
    # 
    # assert_response :success
  end

  test "should get edit" do
    get :edit, :id => events(:one).id
    
    assert_response :success
  end

  test "should update event" do
    put :update, :id => events(:one).id, :event => {
      :group_id => groups(:two).id,
      }
      
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, :id => events(:one).id
    end

    assert_redirected_to events_path
  end
end
