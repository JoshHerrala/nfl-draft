require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  
  def setup
    @team = teams(:browns)
    #@team = Team.create(name: "UA Bears", division: "Division A")
  end
  
  test "Should retrieve index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "Should delete logo" do
   get :remove_logo, id: @team.id
   assert_redirected_to team_path
  end
  
  test "Should retrieve logos" do
    get :logos
    assert_response :success
    assert_not_nil assigns(:teams)
  end
  
  test "Should retrieve edit" do
    get :edit, id: @team.id
    assert_response :success
    assert_select "form"
  end
  
  test "Should retrieve show" do
    get :show, id: @team.id
    assert_response :success
    assert_select 'h2', 'browns'  
  end

  test "Should retrieve update" do
    patch :update, id: @team, team: {name: @team.name, division: @team.division}
    assert_redirected_to logos_teams_path
  end
  
end