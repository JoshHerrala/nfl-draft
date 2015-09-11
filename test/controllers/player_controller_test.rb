require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end

  test "Should retrieve not_picked" do
    get :not_picked
    assert_response :success
  end
  

end