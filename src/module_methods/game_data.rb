require_relative '../game'

module GameData
  include Storage

  def read_game
    get_data('./src/data/games.json')
  end

  def write_game(game)
    update_data(game, './src/data/games.json')
  end
end
