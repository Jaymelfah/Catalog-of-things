require_relative './label'
require_relative './module_methods/music_genre'
require_relative './module_methods/book'
require_relative './module_methods/label'
require_relative './music_album'
require_relative './genre'
require_relative './books'
class App
  include MusicGenreModule
  include LabelModule
  include BookModule

  def initialize
    @music_albums = []
    @genres = []
    show_genres
    @books = read_books
    @labels = read_labels
  end

  def list_all_books
    list_books(@books)
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
    list_labels(@labels)
  end

  def list_all_authors
    puts 'Author Listed'
  end

  def add_author
    # Author Properties
  end

  def add_book
    label = add_label('Book')
    # author = add_author
    # genre = add_genre
    print 'Book Cover Status - [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Book Publisher: '
    publisher = gets.chomp
    print 'Publishing date - [year/month/day]: '
    published_date = gets.chomp
    book = Book.new(publisher, cover_state, published_date)
    label.add_item(book)
    # genre.add_item(book)
    # author.add_item(book)

    @books << book
    @labels << label
    # @genres << genre
    # @authors << author

    store_books(@books)
    puts "\n The book '#{label.title}' was created successfully!✅ "
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
