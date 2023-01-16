require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = SecureRandom.hex(7)
    @title = title
    @color = color
    @items = []
  end

end