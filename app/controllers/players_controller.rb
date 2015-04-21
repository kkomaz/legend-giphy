class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    # @player_stats = Lol.new.player_stats(@player)
    
  end
end
