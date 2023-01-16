require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label, :genre, :author

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  private
end