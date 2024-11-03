require "test_helper"

class PostDataControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_data_show_url
    assert_response :success
  end

  test "should get index" do
    get post_data_index_url
    assert_response :success
  end

  test "should get edit" do
    get post_data_edit_url
    assert_response :success
  end
end
