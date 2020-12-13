require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get activity" do
    get dashboard_activity_url
    assert_response :success
  end

  test "should get monitoring" do
    get dashboard_monitoring_url
    assert_response :success
  end

  test "should get manage" do
    get dashboard_manage_url
    assert_response :success
  end
end
