require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get exit" do
    get sessions_exit_url
    assert_response :success
  end

  test "should get sign_in" do
    get sessions_sign_in_url
    assert_response :success
  end

  test "should get sign_out" do
    get sessions_sign_out_url
    assert_response :success
  end
end
