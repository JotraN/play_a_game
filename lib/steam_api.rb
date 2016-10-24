require 'net/http'
require 'json'

class SteamApi
  attr_reader :steam_key, :steam_id

  def initialize(steam_key, steam_id)
    @steam_key = steam_key
    @steam_id = steam_id
  end
  
  def get_hash(url)
    uri = URI(url)
    resp = Net::HTTP.get(uri)
    JSON.parse(resp)
  end

  def get_games
    url = "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/"\
          "?format=json&include_played_free_games=1&include_appinfo=1"\
          "&key=#{@steam_key}&steamid=#{@steam_id}"
    begin 
      games_hash = get_hash(url)["response"]["games"]
    rescue JSON::ParserError
      games_hash = {}
    end
  end

  private :get_hash
end
