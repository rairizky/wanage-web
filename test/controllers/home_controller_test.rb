require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get greet" do
    get home_greet_url
    assert_response :success
  end
end
