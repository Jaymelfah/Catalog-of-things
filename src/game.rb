require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *parent_args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(parent_args)
  end

  def can_be_archived?
    super() and last_played_at < 2
  end
end
