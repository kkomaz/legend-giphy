class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    # @player_status = Lol.new.player_status(@player)
  end
end
