class OwnershipsController < ApplicationController
  
  def index
    @ownerships = Ownership.where(player_id: nil) 
    #Ineffcient ruby eqivalent: Ownership.all.select { |t| t.player_id == nil}
    
    if Ownership.find_by(player_id: nil) != nil
      Rails.application.config.counter = Ownership.find_by(player_id: nil).id
    else
      Rails.application.config.counter = 500
    end
  end

  def results
    @ownerships = Ownership.where.not(player_id: nil)
  end
  
  def round
    @ownerships = Ownership.where(round: params[:round])
  end
  
  def last_three
    @ownerships = Ownership.where.not(player_id: nil).last(3) | Ownership.where(player_id: nil).first(1)
    
  end
  
  def show
    @ownership = Ownership.find(params[:id])
  end

  def edit
    @ownership = Ownership.find(params[:id])
    @players = Player.all
  end

  def update
    @ownership = Ownership.find(params[:id])
    
    if @ownership.update(ownership_params)
      
      redirect_to ownerships_path
    else
      render 'edit'
    end
  end

  private
  def ownership_params
    params.require(:ownership).permit(:round,:pick,:team_id,:player_id)
  end

end
