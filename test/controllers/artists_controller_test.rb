require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, artist: { address: @artist.address, bday: @artist.bday, bmonth: @artist.bmonth, byear: @artist.byear, cellphone: @artist.cellphone, city: @artist.city, contract_day: @artist.contract_day, contract_month: @artist.contract_month, contract_year: @artist.contract_year, email: @artist.email, first: @artist.first, homephone: @artist.homephone, last: @artist.last, officephone: @artist.officephone, state: @artist.state, title: @artist.title, zipareas: @artist.zipareas, zipcode: @artist.zipcode }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist
    assert_response :success
  end

  test "should update artist" do
    patch :update, id: @artist, artist: { address: @artist.address, bday: @artist.bday, bmonth: @artist.bmonth, byear: @artist.byear, cellphone: @artist.cellphone, city: @artist.city, contract_day: @artist.contract_day, contract_month: @artist.contract_month, contract_year: @artist.contract_year, email: @artist.email, first: @artist.first, homephone: @artist.homephone, last: @artist.last, officephone: @artist.officephone, state: @artist.state, title: @artist.title, zipareas: @artist.zipareas, zipcode: @artist.zipcode }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end
end
