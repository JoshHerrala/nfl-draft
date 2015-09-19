class PlayersController < ApplicationController
  def index
    @players = Player.all.sort_by{ |x| [x.position, x.last_name] }
  end
  
  def not_picked
    @players = Player.all.select { |m| m.team == nil}.sort_by{ |x| [x.position, x.last_name] }
  end
  
  def admin_index
    @players = Player.all
  end
  
  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    
    if @player.update(player_params)
      redirect_to admin_index_players_path
    else
      render 'edit'
    end
  end


private

def player_params
  params.require(:player).permit(:name, :position)
end
end