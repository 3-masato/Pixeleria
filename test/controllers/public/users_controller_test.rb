require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get update" do
    get public_users_update_url
    assert_response :success
  end

  test "should get confirm" do
    get public_users_confirm_url
    assert_response :success
  end

  test "should get leave" do
    get public_users_leave_url
    assert_response :success
  end
end
