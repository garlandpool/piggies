require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, host: { artist_id: @host.artist_id, c_phone: @host.c_phone, city: @host.city, first: @host.first, h_phone: @host.h_phone, last: @host.last, state: @host.state, street: @host.street, visible: @host.visible, zipcode: @host.zipcode }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    get :show, id: @host
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host
    assert_response :success
  end

  test "should update host" do
    patch :update, id: @host, host: { artist_id: @host.artist_id, c_phone: @host.c_phone, city: @host.city, first: @host.first, h_phone: @host.h_phone, last: @host.last, state: @host.state, street: @host.street, visible: @host.visible, zipcode: @host.zipcode }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
end
