class PlayersController < ApplicationController
  
  #force the index's togetherby passing in a param.
  #use the draft round model
  
  def index
    @players = Player.all.order(position: :asc, surname: :asc)
  end
  
  def not_picked
    #@players = Player.where(team: nil).order(position: :asc, surname: :asc)
    @players = Player.joins("LEFT OUTER JOIN ownerships ON ownerships.player_id = players.id").joins("LEFT OUTER JOIN teams ON ownerships.team_id = teams.id").where("teams.id IS NULL").order(position: :asc, surname: :asc)
  end
  
  def admin_index
    @players = Player.all
  end
  
  def position
    @players = Player.where(position: params[:position]).order(surname: :asc)
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
  params.require(:player).permit(:name, :surname, :position)
end
end