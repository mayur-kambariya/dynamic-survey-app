require "test_helper"

class Api::V1::SurveyResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_survey_responses_create_url
    assert_response :success
  end
end
