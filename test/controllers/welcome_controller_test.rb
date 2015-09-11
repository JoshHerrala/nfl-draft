require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end
  
  test "Should retrieve contact" do
    get :contact
    assert_response :success
  end

end