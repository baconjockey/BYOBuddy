require 'test_helper'

class PairingDescriptorsControllerTest < ActionController::TestCase
  setup do
    @pairing_descriptor = pairing_descriptors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pairing_descriptors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pairing_descriptor" do
    assert_difference('PairingDescriptor.count') do
      post :create, pairing_descriptor: @pairing_descriptor.attributes
    end

    assert_redirected_to pairing_descriptor_path(assigns(:pairing_descriptor))
  end

  test "should show pairing_descriptor" do
    get :show, id: @pairing_descriptor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pairing_descriptor.to_param
    assert_response :success
  end

  test "should update pairing_descriptor" do
    put :update, id: @pairing_descriptor.to_param, pairing_descriptor: @pairing_descriptor.attributes
    assert_redirected_to pairing_descriptor_path(assigns(:pairing_descriptor))
  end

  test "should destroy pairing_descriptor" do
    assert_difference('PairingDescriptor.count', -1) do
      delete :destroy, id: @pairing_descriptor.to_param
    end

    assert_redirected_to pairing_descriptors_path
  end
end
