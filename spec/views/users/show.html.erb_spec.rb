require 'rails_helper'

RSpec.describe "users/show", type: :view do

  describe "shows game" do
    it "displays the random game" do
      game = assign(:game, {"name" => "Game"})
      render
      expect(rendered).to match game["name"]
    end

    it "displays an error if the game is nil" do
      assign(:game, nil)
      render
      expect(rendered).to match /Error \- No game found\./
    end
  end

end
