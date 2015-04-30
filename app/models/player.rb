class Player < ActiveRecord::Base
  has_many :stats
  has_many :characters, :through => :stats

  def pull_videos
    YoutubeApi.new.get_youtube_vid(self.name)
  end

  def get_status
    Lol.new.player_status(self)
  end

  def get_twitter
    TwitterApi.new.get_twitter_feed(self.twitter_name).take(3)
  end

end
