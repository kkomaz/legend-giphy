class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :character

  def get_character
    Character.find(self.character_id)
  end


  
end
