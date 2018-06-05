require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get buyerinput" do
    get main_buyerinput_url
    assert_response :success
  end

end
