require 'test_helper'

class HowsControllerTest < ActionController::TestCase
  setup do
    @how = hows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create how" do
    assert_difference('How.count') do
      post :create, how: { body: @how.body, symbol: @how.symbol, title: @how.title }
    end

    assert_redirected_to how_path(assigns(:how))
  end

  test "should show how" do
    get :show, id: @how
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @how
    assert_response :success
  end

  test "should update how" do
    patch :update, id: @how, how: { body: @how.body, symbol: @how.symbol, title: @how.title }
    assert_redirected_to how_path(assigns(:how))
  end

  test "should destroy how" do
    assert_difference('How.count', -1) do
      delete :destroy, id: @how
    end

    assert_redirected_to hows_path
  end
end
