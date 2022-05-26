require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get tagging" do
    get tools_tagging_url
    assert_response :success
  end
end
