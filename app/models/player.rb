class Player < ActiveRecord::Base
  has_many :player_characters
  has_many :characters, :through => :player_characters

  def player_stats
    Lol.new.player_stats(self)["champions"].collect do |attributes|
      attributes["id"]
      # attributes["stats"]["totalSessionLost"]
      # attributes["stats"]["totalSessionsWon"]
    end
  end

  def get_images
    self.characters.where(:key => player_stats).pluck("image")
  end

  def get_status
    Lol.new.player_status(self)
  end

end

