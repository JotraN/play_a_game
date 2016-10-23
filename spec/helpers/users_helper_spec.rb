require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do

  describe 'get random game' do
    it 'gets a random game' do
      games = ['game1', 'game2']
      random_game = helper.get_random_game(games)
      expect(games).to include(random_game)
    end

    it 'returns nil if no games' do
      games = []
      random_game = helper.get_random_game(games)
      expect(helper.get_random_game(games)).to be_nil
    end
  end

end
