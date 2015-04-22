require 'json'
require 'open-uri'

class Lol
  attr_accessor :player

  PLAYER_INFO = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/"
  PLAYER_STATUS = "https://na.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/NA1/"
  PLAYER_STATS = "https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/"
  
  def get_player_data(player)
    @player = "#{PLAYER_INFO}#{player}?api_key=#{ENV["API_KEY"]}"
    @player_hash = JSON.load(open(@player))
  end

  def player_status(player)
    status = "#{PLAYER_STATUS}#{player.player_key}?api_key=#{ENV["API_KEY"]}"
    begin
      status_hash = JSON.load(open(status))
      "Yep! He's playing!"
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
      "Nope not playing"
      end
    end
  end

  def player_stats(player)
    stats = "#{PLAYER_STATS}#{player.player_key}/ranked?season=SEASON2015&api_key=#{ENV["API_KEY"]}"
    stats_hash = JSON.load(open(stats))
  end
end