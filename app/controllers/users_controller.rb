require 'steam_api'

class UsersController < ApplicationController
  include UsersHelper

  def index
  end

  def show
    api = SteamApi.new(Rails.application.secrets.STEAM_KEY, params[:id])
    games = api.get_games
    @game = get_random_game(games)
  end

  def search
    redirect_to user_path(params[:id])
  end
end
