require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get edit_post" do
    get :edit_post
    assert_response :success
  end

  test "should get delete_post" do
    get :delete_post
    assert_response :success
  end

  test "should get create_post" do
    get :create_post
    assert_response :success
  end

end
