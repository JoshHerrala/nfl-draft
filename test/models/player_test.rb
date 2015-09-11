require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  
  def setup
      @player = Player.new(name: "Inigo Montoya", position: "Avenger")
  end 

  test "player must be valid" do
    assert @player.valid?
  end

  test "name should be present" do
    @player.name = nil
    assert @player.invalid? 
  end

  test "division should be present" do
    @player.position = nil
    assert @player.invalid? 
  end

  end