require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "user :one has one session" do
    get root_url
    assert users(:one).sessions.one?
  end

  test "redirect if user not authenticated" do
    logout
    get root_url
    assert_redirected_to new_session_path
  end
end
