require 'test_helper'

class OwnershipsControllerTest < ActionController::TestCase
  
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end
  
  test "Should retrieve results" do
    get :round1
    assert_response :success
  end

  test "Should retrieve last three results" do
    get :last_three
    assert_response :success
  end


end