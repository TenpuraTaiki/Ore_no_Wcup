require 'test_helper'

class WcupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wcups_index_url
    assert_response :success
  end

  test "should get show" do
    get wcups_show_url
    assert_response :success
  end

end
