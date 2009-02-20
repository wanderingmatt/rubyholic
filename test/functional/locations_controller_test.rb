require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations" do
    assert_difference('Locations.count') do
      post :create, :locations => { }
    end

    assert_redirected_to locations_path(assigns(:locations))
  end

  test "should show locations" do
    get :show, :id => locations(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => locations(:one).id
    assert_response :success
  end

  test "should update locations" do
    put :update, :id => locations(:one).id, :locations => { }
    assert_redirected_to locations_path(assigns(:locations))
  end

  test "should destroy locations" do
    assert_difference('Locations.count', -1) do
      delete :destroy, :id => locations(:one).id
    end

    assert_redirected_to locations_path
  end
end
