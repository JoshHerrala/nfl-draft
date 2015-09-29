require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  def setup
    @player = players(:john)
    #@player = Player.create(name: "Bo Jackson", position: "FB")
  end
  
  test "Should retrieve index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
    assert_select "td", 15
  end

  #Each row in the not_picked table has 3 <td>
  #player mike is not assigned to an ownership 
  
  test "Should retrieve not_picked" do
    get :not_picked
    assert_response :success
    assert_not_nil assigns(:players)
    assert_select "td", 3 
  end
  
  test "Should retrieve admin_index" do
    get :admin_index
    assert_response :success
    assert_not_nil assigns(:players)
  end
  
  #Each row in the position table has 3 <td>
  #players mike and john are QBs
  
  test "Should retrieve position" do
    get :position, position: :QB #@player
    assert_response :success
    assert_select "td", 6
  end
  
  test "Should retrieve edit" do
    get :edit, id: @player.id
    assert_response :success
    assert_select "form"
  end
  
  test "Should retrieve update" do
    patch :update, id: @player, player: { name: @player.name, surname: @player.surname, position: @player.position}
    assert_redirected_to admin_index_players_path
  end

end