require 'test_helper'

class Api::V1::ProfileDataControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_profile_data_show_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_profile_data_update_url
    assert_response :success
  end

end
