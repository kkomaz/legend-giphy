class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @player_stats = Kaminari.paginate_array(@player.stats).page(params[:page]).per(4)
    # @client = TwitterApi.new
    # @player_twitter = @client.get_twitter_feed(@player.twitter_name).take(3)
  end
end
