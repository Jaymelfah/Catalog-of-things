require_relative './module_methods/music_genre'
require_relative './music_album'
require_relative './genre'

class App
  include MusicGenreModule

  def initialize
    @music_albums = []
    @genres = []
    show_genres
  end

  def list_all_books
    puts 'books Listed'
  end

  def list_all_music_albums
    list_all_music_albums_music_module
  end

  def list_all_games
    puts 'games Listed'
  end

  def list_all_genres
    list_all_genres_music_module
  end

  def list_all_labels
    puts 'Label Listed'
  end

  def list_all_authors
    puts 'Author Listed'
  end

  def add_book
    puts 'Book Added'
  end

  def add_music_album
    add_music_album_music_module
  end

  def add_game
    puts 'Game Added'
  end

  def quit_app
    exit
  end
end
