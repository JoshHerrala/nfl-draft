require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  
  def setup
    @team = Team.create(name: "UA Bears", division: "Division A")
  end
  
  test "Should retrieve index" do
    get :index
    assert_response :success
  end

  test "Should retrieve edit" do
    get :edit, id: @team.id
    assert_response :success
  end
  
  test "Should retrieve show" do
    get :show, id: @team.id
    assert_response :success
    assert_select 'h2', 'UA Bears'  
  end

  
end