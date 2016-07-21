require 'test_helper'

class Api::V1::SwitchesControllerTest < ActionController::TestCase
  setup do
    @api_v1_switch = api_v1_switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_v1_switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_v1_switch" do
    assert_difference('Api::V1::Switch.count') do
      post :create, api_v1_switch: {  }
    end

    assert_redirected_to api_v1_switch_path(assigns(:api_v1_switch))
  end

  test "should show api_v1_switch" do
    get :show, id: @api_v1_switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_v1_switch
    assert_response :success
  end

  test "should update api_v1_switch" do
    patch :update, id: @api_v1_switch, api_v1_switch: {  }
    assert_redirected_to api_v1_switch_path(assigns(:api_v1_switch))
  end

  test "should destroy api_v1_switch" do
    assert_difference('Api::V1::Switch.count', -1) do
      delete :destroy, id: @api_v1_switch
    end

    assert_redirected_to api_v1_switches_path
  end
end
