require "test_helper"

class ActivityItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get check_answer" do
    get activity_items_check_answer_url
    assert_response :success
  end
end
