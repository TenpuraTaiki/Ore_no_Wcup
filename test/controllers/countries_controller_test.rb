require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get europe" do
    get countries_europe_url
    assert_response :success
  end

  test "should get africa" do
    get countries_africa_url
    assert_response :success
  end

  test "should get southamerica" do
    get countries_southamerica_url
    assert_response :success
  end

  test "should get concacaf" do
    get countries_concacaf_url
    assert_response :success
  end

  test "should get asia" do
    get countries_asia_url
    assert_response :success
  end

  test "should get oceania" do
    get countries_oceania_url
    assert_response :success
  end

  test "should get 32nd" do
    get countries_32nd_url
    assert_response :success
  end

end
