class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @player_stats = Kaminari.paginate_array(@player.stats).page(params[:page]).per(4)
  end
end
