require 'json'
require 'open-uri'

class TwitterApi
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end 

  def get_twitter_feed(player)
    result = @client.user_timeline(player)
    result.collect do |tweet|
      @client.oembed(tweet.id).html
    end
  end
end
