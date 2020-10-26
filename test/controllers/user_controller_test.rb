require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get user_profile" do
    get user_user_profile_url
    assert_response :success
  end

end
