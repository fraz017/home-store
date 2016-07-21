require 'test_helper'

class Api::V1::RoomsControllerTest < ActionController::TestCase
  setup do
    @api_v1_room = api_v1_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_v1_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_v1_room" do
    assert_difference('Api::V1::Room.count') do
      post :create, api_v1_room: {  }
    end

    assert_redirected_to api_v1_room_path(assigns(:api_v1_room))
  end

  test "should show api_v1_room" do
    get :show, id: @api_v1_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_v1_room
    assert_response :success
  end

  test "should update api_v1_room" do
    patch :update, id: @api_v1_room, api_v1_room: {  }
    assert_redirected_to api_v1_room_path(assigns(:api_v1_room))
  end

  test "should destroy api_v1_room" do
    assert_difference('Api::V1::Room.count', -1) do
      delete :destroy, id: @api_v1_room
    end

    assert_redirected_to api_v1_rooms_path
  end
end
