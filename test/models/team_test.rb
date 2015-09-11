require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  def setup
     @team = Team.new(name: "Upper Arlington Bears", division: "Division A")
  end 

test "team must be valid" do
  assert @team.valid?
end

test "name should be present" do
  @team.name = nil
  assert @team.invalid? 
end

test "division should be present" do
  @team.division = nil
  assert @team.invalid? 
end

end