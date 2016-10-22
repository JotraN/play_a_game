require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserHelper, type: :helper do

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
