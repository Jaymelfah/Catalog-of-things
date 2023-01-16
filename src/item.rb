require 'securerandom'
require 'date'

class Item
  attr_reader :id, :publish_date, :archived, :genre

  def initialize(publish_date, archived: false)
    @id = SecureRandom.hex(7)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
