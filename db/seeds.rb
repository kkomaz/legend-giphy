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
player_twitter = ["Hai_L9", "meteoslol", "C9Balls", "C9Sneaky", "LemonnNation"]

player_image = ["http://hydra-media.cursecdn.com/lol.gamepedia.com/3/3d/HAI.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/1/10/METEOS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/b/bc/BALLS.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/9/93/SNEAKY.C9_lolesports.PP_0.jpg",
                "http://hydra-media.cursecdn.com/lol.gamepedia.com/d/d0/LEMONNATION.C9_lolesports.PP_0.jpg"
                ]

players.each.with_index do |player,index|
  info = Lol.new.get_player_data(player)
  Player.create(:player_key => info[player.downcase]["id"], :name => info[player.downcase]["name"], :image => player_image[index], :twitter_name => player_twitter[index])
end

Player.all.each do |player|
  data_stats = Lol.new.player_stats(player)
  data_stats["champions"].each do |character_info|
    riot_p_id = character_info["id"]
    games_won = character_info["stats"]["totalSessionsWon"]
    games_lost = character_info["stats"]["totalSessionsLost"]
    character_kills = character_info["stats"]["totalChampionKills"]
    character_assists = character_info["stats"]["totalAssists"]
    Stat.create(:player_id => player.id, :character_id => Character.where(:key => riot_p_id).pluck(:id).join(""),
                 :games_won => games_won, :games_lost => games_lost, :character_kills => character_kills, :character_assists => character_assists)
  end
end

Stat.all.where(:character_id => nil).destroy_all