require "test_helper"

class PhrasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get phrases_index_url
    assert_response :success
  end

  test "should get audio" do
    get phrases_audio_url
    assert_response :success
  end
end
