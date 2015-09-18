class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
  end

  def remove_logo 
    @team = Team.find(params[:id])
    @team.logo = nil
    @team.save
    redirect_to @team
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def logos
    @teams = Team.all
  end
  
  def update
    @team = Team.find(params[:id])
    
    if @team.update(team_params)
      redirect_to teams_path
    else
      render 'edit'
    end
  end
  
  
  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end
  
  private
  def team_params
    params.require(:team).permit(:name, :logo, :division)
  end

end
