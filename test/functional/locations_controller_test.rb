require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[name]'
    }
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[latitude]'
    }
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[longitude]'
    }
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, :location => {
        :name => 'Vivace',
        :latitude => '47.62193',
        :longitude => '-122.3174'
        }
    end

    assert_redirected_to location_path(assigns(:location))
  end
  
  test "should not create invalid location" do
    assert_difference('Location.count', 0) do
      post :create, :location => {
        :name => ''
        }
    end

    assert_not_nil assigns(:location).errors.on :name
  end

  test "should show location" do
    get :show, :id => locations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => locations(:one).id
    
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[name]'
    }
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[latitude]'
    }
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[longitude]'
    }
    assert_response :success
  end

  test "should update location" do
    put :update, :id => locations(:one).id, :location => {
      :name => 'Project-X Laboratory'
      }
      
    assert_redirected_to location_path(assigns(:location))
    assert_equal 'Project-X Laboratory', Location.find(locations(:one).id).name
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:one).id
    end

    assert_redirected_to locations_path
  end
end
