require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get participations_index_url
    assert_response :success
  end

  test "should get shuffle" do
    get participations_shuffle_url
    assert_response :success
  end

end
