require 'rails_helper'
require 'steam_api'

RSpec.describe 'Steam API', :vcr do
  before :each do
    @KEY = Rails.application.secrets.STEAM_KEY
    @ID = Rails.application.secrets.STEAM_ID
    @steam_api = SteamApi.new(@KEY, @ID)
  end

  it 'downloads and parses json' do 
    url = 'https://en.wikipedia.org/w/api.php?action=query&titles=json&format=json'
    hash = @steam_api.send(:get_hash, url)
    expect(hash).to be_an_instance_of(Hash)
  end

  it 'throws an error if not json url' do
    url = 'https://en.wikipedia.org/w/api.php?action=query&titles=json&format=xml'
    expect { @steam_api.send(:get_hash, url) }.to raise_error(JSON::ParserError)
  end

  it 'gets a user\'s games' do
    games = @steam_api.get_games
    expect(games).not_to be_empty
  end

  it 'returns nothing with invalid user id' do
    steam_api = SteamApi.new(@KEY, '123') 
    games = steam_api.get_games
    expect(games).to be_empty
  end

  it 'returns nothing with invalid api key' do
    steam_api = SteamApi.new('123', @ID) 
    games = steam_api.get_games
    expect(games).to be_empty
  end

end
