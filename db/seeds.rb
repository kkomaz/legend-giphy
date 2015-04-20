# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

file = File.read('db/champions.json')
data_hash = JSON.parse(file)

data_hash["data"].each do |character, attribute|
  Character.create(:name => attribute["name"],
                   :title => attribute["title"],
                   :blurb => attribute["blurb"]
                  )
end



