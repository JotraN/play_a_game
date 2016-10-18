require 'spec_helper'
require 'steam_api'

RSpec.describe "Steam API" do

  it 'downloads and parses json' do 
    steam_api = SteamApi.new(nil)
    url = "https://en.wikipedia.org/w/api.php?action=query&titles=json&format=json"
    hash = steam_api.send(:get_hash, url)
    expect(hash).to include("batchcomplete")
  end

end
