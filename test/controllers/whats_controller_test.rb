require 'test_helper'

class WhatsControllerTest < ActionController::TestCase
  setup do
    @what = whats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what" do
    assert_difference('What.count') do
      post :create, what: { body: @what.body, font_awesome: @what.font_awesome, title: @what.title }
    end

    assert_redirected_to what_path(assigns(:what))
  end

  test "should show what" do
    get :show, id: @what
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @what
    assert_response :success
  end

  test "should update what" do
    patch :update, id: @what, what: { body: @what.body, font_awesome: @what.font_awesome, title: @what.title }
    assert_redirected_to what_path(assigns(:what))
  end

  test "should destroy what" do
    assert_difference('What.count', -1) do
      delete :destroy, id: @what
    end

    assert_redirected_to whats_path
  end
end
