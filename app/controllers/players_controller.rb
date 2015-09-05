class PlayersController < ApplicationController
  def index
    @players = Player.all.sort_by{ |x| [x.position, x.last_name] }
  end
  
  def not_picked
    @players = Player.all.select { |m| m.team == nil}.sort_by{ |x| [x.position, x.last_name] }
  end
end