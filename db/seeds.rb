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

players = ["C9Hai", "C9Meteos", "C9Balls", "C9Sneaky", "C9Lemonation"]
player_image = ["http://hydra-media.cursecdn.com/lol.gamepedia.com/3/3d/HAI.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/1/10/METEOS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/b/bc/BALLS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/9/93/SNEAKY.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/d/d0/LEMONNATION.C9_lolesports.PP_0.jpg"
                ]

players.each.with_index do |player,index|
  stats = Lol.new.get_player_data(player)
  Player.create(:player_id => stats[player.downcase]["id"], :name => stats[player.downcase]["name"], :image => player_image[index])
end



