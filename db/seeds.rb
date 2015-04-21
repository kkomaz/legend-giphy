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

players = ["C9Hai", "C9Meteos", "C9Balls", "C9Sneaky", "C9LemonNation"]
player_image = ["http://hydra-media.cursecdn.com/lol.gamepedia.com/3/3d/HAI.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/1/10/METEOS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/b/bc/BALLS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/9/93/SNEAKY.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/d/d0/LEMONNATION.C9_lolesports.PP_0.jpg"
                ]

players.each.with_index do |player,index|
  info = Lol.new.get_player_data(player)
  Player.create(:player_id => info[player.downcase]["id"], :name => info[player.downcase]["name"], :image => player_image[index])
end

Player.all.each do |player|
  Character.all.each do |character|
    PlayerCharacter.create(:player_id => player.id, :character_id => character.id)
  end
end