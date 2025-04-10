require "test_helper"

class Api::V1::KpiDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_kpi_dashboard_index_url
    assert_response :success
  end
end
