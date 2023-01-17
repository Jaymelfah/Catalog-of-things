require 'securerandom'
require_relative './music_album'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = SecureRandom.hex(7)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
