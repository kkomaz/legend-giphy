class Character < ActiveRecord::Base
  has_many :stats
  has_many :players, :through => :stats
end
