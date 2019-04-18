require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest
  test "should get manage" do
    get room_manage_url
    assert_response :success
  end

  test "should get play" do
    get room_play_url
    assert_response :success
  end

end
