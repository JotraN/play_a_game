module UsersHelper

  def get_random_game(games)
    index = rand(games.length)
    games[index]
  end

end
