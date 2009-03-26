require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    
    assert_tag :tag => 'input', :attributes => {
      :name => 'group[name]'
    }
    assert_response :success
  end

  test "should create group" do
    @request.cookies['http_referer'] = CGI::Cookie.new('http_referer', '/groups/')
    
    assert_difference('Group.count') do
      post :create, :group => {
        :name => 'X-Men'
        }
    end

    assert_equal @response.cookies["new_item"], ["group"]
    assert_redirected_to '/groups/'
  end
  
  test "should redirect back to new event" do
    @request.cookies['http_referer'] = CGI::Cookie.new('http_referer', '/events/new')
    
    assert_difference('Group.count') do
      post :create, :group => {
        :name => 'X-Men'
        }
    end

    assert_redirected_to '/events/new'    
  end
  
  test "should not create invalid group" do
    assert_difference('Group.count', 0) do
      post :create, :group => {
        :name => ''
        }
    end
  
    assert_not_nil assigns(:group).errors.on :name
  end

  test "should show group" do
    get :show, :id => groups(:one).id
    
    assert_response :success
  end
  
  test "should not show invalid group" do
    get :show, :id => Group.maximum(:id) + 1
  
    assert_response :redirect
    assert flash[:notice]
  end

  test "should get edit" do
    get :edit, :id => groups(:one).id
    
    assert_tag :tag => 'input', :attributes => {
      :name => 'group[name]'
    }
    assert_response :success
  end
  
  test "should not edit invalid product" do
    get :edit, :id => Group.maximum(:id) + 1

    assert_response :redirect
    assert flash[:notice]
  end

  test "should update group" do
    put :update, :id => groups(:one).id, :group => {
      :name => 'Uncanny X-Men'
      }
    
    assert_redirected_to group_path(assigns(:group))
    assert_equal 'Uncanny X-Men', Group.find(groups(:one).id).name
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, :id => groups(:one).id
    end

    assert_redirected_to groups_path
  end
end
