require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  
  def setup
      @ownership = Ownership.new(round: "1", pick: "1", team_id: "1")
  end 

  test "ownership must be valid" do
    assert @ownership.valid?
  end

  test "round should be present" do
    @ownership.round = nil
    assert @ownership.invalid? 
  end

  test "pick should be present" do
      @ownership.pick = nil
      assert @ownership.invalid? 
  end
  
  test "team_id should be present" do
    @ownership.team_id = nil
     assert @ownership.invalid? 
  end

  end