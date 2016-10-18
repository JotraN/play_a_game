require 'net/http'
require 'json'

class SteamApi
  attr_accessor :steam_id

  def initialize(steam_id)
    @steam_id = steam_id
  end
  
  def get_hash(url)
    uri = URI(url)
    resp = Net::HTTP.get(uri)
    JSON.parse(resp)
  end

  private :get_hash
end
