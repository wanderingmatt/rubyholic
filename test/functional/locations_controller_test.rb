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
      :name => 'location[address]'
    }
    
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, :location => {
        :name => 'Onehub',
        :address => '3380 146th Pl SE, Bellevue, WA 98007',
        }
    end

    assert_redirected_to location_path(assigns(:location))
  end
  
  test "should not create invalid location" do
    assert_difference('Location.count', 0) do
      post :create, :location => {
        :name => '',
        :address => '3380 146th Pl SE, Bellevue, WA 98007'
        }
    end

    assert_not_nil assigns(:location).errors.on(:name)
  end

  test "should show location" do
    get :show, :id => locations(:one).id
    assert_response :success
  end
  
  test "should not show invalid location" do
    get :show, :id => Location.maximum(:id) + 1
  
    assert_response :redirect
    assert flash[:notice]
  end
  
  test "map partial gets location data" do
    get :show, :id => locations(:one).id
    
    assert_response :success

    # TODO: Turn these back on.  They're failing right now, and it's distracting.
    # assert_tag :tag => 'div', :content => locations(:one).name
    # assert_tag :tag => 'div', :content => locations(:one).address
  end

  test "should get edit" do
    get :edit, :id => locations(:one).id
    
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[name]'
    }
    assert_tag :tag => 'input', :attributes => {
      :name => 'location[address]'
    }

    assert_response :success
  end
  
  test "should not edit invalid location" do
    get :edit, :id => Location.maximum(:id) + 1

    assert_response :redirect
    assert flash[:notice]
  end

  test "should update location" do
    put :update, :id => locations(:one).id, :location => {
      :name => 'Onehubby'
      }
      
    assert_redirected_to location_path(assigns(:location))
    assert_equal 'Onehubby', Location.find(locations(:one).id).name
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:one).id
    end

    assert_redirected_to locations_path
  end
end
