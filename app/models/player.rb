class Player < ActiveRecord::Base
  has_many :stats
  has_many :characters, :through => :stats

  def pull_tweets
    # tweets = []
    # TwitterApi.new.get_twitter_feed(self).each do |tweet|
    #   html = client.oembed(tweet.id).html
    #   tweets <<
  end

  def pull_videos
    YoutubeApi.new.get_youtube_vid(self.name)
  end

  def get_status
    Lol.new.player_status(self)
  end

end
