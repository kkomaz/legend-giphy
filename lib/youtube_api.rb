require 'youtube_it'
require 'json'
require 'open-uri'

class YoutubeApi

  attr_accessor :client 

  def initialize
    @client = YouTubeIt::Client.new(:dev_key => ENV["YOUTUBE_API_KEY"])
  end

  def get_youtube_vid(player)
    vids = @client.videos_by(:query => player).videos
    get_embedded_vid(vids)
  end

  def get_embedded_vid(vids)
    vids.shift
    vids.sample.embed_html5(:id => "ytplayer", :width => 640, :height => 390)
  end
end

