require 'test_helper'

class PairingsControllerTest < ActionController::TestCase
  setup do
    @pairing = pairings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pairings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pairing" do
    assert_difference('Pairing.count') do
      post :create, pairing: @pairing.attributes
    end

    assert_redirected_to pairing_path(assigns(:pairing))
  end

  test "should show pairing" do
    get :show, id: @pairing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pairing.to_param
    assert_response :success
  end

  test "should update pairing" do
    put :update, id: @pairing.to_param, pairing: @pairing.attributes
    assert_redirected_to pairing_path(assigns(:pairing))
  end

  test "should destroy pairing" do
    assert_difference('Pairing.count', -1) do
      delete :destroy, id: @pairing.to_param
    end

    assert_redirected_to pairings_path
  end
end
