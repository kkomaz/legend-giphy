class Character < ActiveRecord::Base
  has_many :stats
  has_many :players, :through => :stats

  def self.get_name(input)
    Character.find(input.character_id).name
  end
end
