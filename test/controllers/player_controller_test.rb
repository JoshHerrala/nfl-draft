require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  def setup
    @player = Player.create(name: "Bo Jackson", position: "FB")
  end
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end

  test "Should retrieve admin_index" do
    get :admin_index
    assert_response :success
  end
  
  test "Should retrieve not_picked" do
    get :not_picked
    assert_response :success
  end
  
  test "Should retrieve edit" do
    get :edit, id: @player.id
    assert_response :success
  end

end