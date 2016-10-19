require 'rails_helper'
require 'steam_api'

RSpec.describe "Steam API" do
  before :each do
    key = Rails.application.secrets.STEAM_KEY
    id = Rails.application.secrets.STEAM_ID
    @steam_api = SteamApi.new(key, id)
  end

  it 'downloads and parses json' do 
    url = "https://en.wikipedia.org/w/api.php?action=query&titles=json&format=json"
    hash = @steam_api.send(:get_hash, url)
    expect(hash).to include("batchcomplete")
  end

  it 'gets a user\'s games' do
    games = @steam_api.get_games
    expect(games).not_to be_empty
  end
end
