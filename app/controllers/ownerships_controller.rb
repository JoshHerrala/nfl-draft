class OwnershipsController < ApplicationController
  
  def index
    if Rails.application.config.counter == 1
    @ownerships = Ownership.all
  else
    @ownerships = Ownership.all.select { |m| m.pick >= Rails.application.config.counter}
  end
    
  end

  def results
    @ownerships = Ownership.take(Rails.application.config.counter - 1)
  end
  
  def round1
    @ownerships = Ownership.all.select { |m| m.round == 1}
  end
  
  def round2
    @ownerships = Ownership.all.select { |m| m.round == 2}
  end
  def round3
    @ownerships = Ownership.all.select { |m| m.round == 3}
  end
  def round4
    @ownerships = Ownership.all.select { |m| m.round == 4}
  end
  def round5
    @ownerships = Ownership.all.select { |m| m.round == 5}
  end
  def round6
    @ownerships = Ownership.all.select { |m| m.round == 6}
  end
  def round7
    @ownerships = Ownership.all.select { |m| m.round == 7}
  end
  
  
  def last_three
    @ownerships = Ownership.take(Rails.application.config.counter).last(4)  
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
      Rails.application.config.counter += 1
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