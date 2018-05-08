require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get homes_select_url
    assert_response :success
  end

end
