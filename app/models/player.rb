class Player < ActiveRecord::Base
  has_many :stats
  has_many :characters, :through => :stats

  def player_stats(player)
  end

  def get_characters_object(player)

  end

  def get_status
    Lol.new.player_status(self)
  end

end


# attributes["stats"]["totalSessionLost"]
# attributes["stats"]["totalSessionsWon"]
