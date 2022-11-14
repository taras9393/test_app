require 'test_helper'

class StatpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get statpages_home_url
    assert_response :success
  end

  test "should get about" do
    get statpages_about_url
    assert_response :success
  end

  test "should get contacts" do
    get statpages_contacts_url
    assert_response :success
  end

end
