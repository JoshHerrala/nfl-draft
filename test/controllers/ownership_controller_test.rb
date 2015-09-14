require 'test_helper'

class OwnershipsControllerTest < ActionController::TestCase
  
  def setup
      @ownership = ownerships(:one)
  end 
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end
  
  test "Should retrieve round" do
    get :round, round: @ownership
    assert_response :success
  end

  test "Should retrieve last three results" do
    get :last_three
    assert_response :success
  end

  test "Should retrieve edit" do
    get :edit, id: @ownership
    assert_response :success
  end
 
  test "Should retrieve update" do
    patch :update, id: @ownership, ownership: {round: @ownership.round, pick: @ownership.pick,
      team_id: @ownership.team_id, player_id: @ownership.player_id}
    assert_redirected_to ownerships_path
  end

end