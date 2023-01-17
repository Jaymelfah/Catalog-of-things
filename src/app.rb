require_relative './label'
require_relative './module_methods/music_genre'
require_relative './music_album'
require_relative './genre'
require_relative './books'
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

  def add_label(thing)
    print "Title of the #{thing}: "
    title = gets.chomp
    print "Color of the #{thing}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_author
    # Author Properties
  end

  def add_book
    label = add_label('Book')
    author = add_author
    genre = add_genre
    puts 'Genre is', genre
    print 'What\'s the state of the Book Cover? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Insert Book Publisher? '
    publisher = gets.chomp
    print 'Insert Publishing date? [year/month/day] (e.g 1937/11/12): '
    published_date = gets.chomp
    book = Book.new(publisher, cover_state, published_date)
    label.add_item(book)
    genre.add_item(book)
    author.add_item(book)
    @books << book
    @labels << label
    @genres << genre
    @authors << author
    puts "\n The book '#{label.title}' by #{author.first_name} #{author.last_name} was created successfully!✅ "
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
