require 'json'

file = File.read('db/champions.json')
data_hash = JSON.parse(file)
img_url = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ahri_0.jpg"

data_hash["data"].each do |character, attribute|
  Character.create(:name => attribute["name"],
                   :title => attribute["title"],
                   :blurb => attribute["blurb"],
                   :key => attribute["key"],
                   :image => "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/#{attribute["name"]}_0.jpg"
                  )
end



