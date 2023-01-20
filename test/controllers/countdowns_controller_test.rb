require "test_helper"

class CountdownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @countdown = countdowns(:one)
  end

  test "should get index" do
    get countdowns_url
    assert_response :success
  end

  test "should get new" do
    get new_countdown_url
    assert_response :success
  end

  test "should create countdown" do
    assert_difference("Countdown.count") do
      post countdowns_url, params: { countdown: { description: @countdown.description, name: @countdown.name, target: @countdown.target } }
    end

    assert_redirected_to countdown_url(Countdown.last)
  end

  test "should show countdown" do
    get countdown_url(@countdown)
    assert_response :success
  end

  test "should get edit" do
    get edit_countdown_url(@countdown)
    assert_response :success
  end

  test "should update countdown" do
    patch countdown_url(@countdown), params: { countdown: { description: @countdown.description, name: @countdown.name, target: @countdown.target } }
    assert_redirected_to countdown_url(@countdown)
  end

  test "should destroy countdown" do
    assert_difference("Countdown.count", -1) do
      delete countdown_url(@countdown)
    end

    assert_redirected_to countdowns_url
  end
end
