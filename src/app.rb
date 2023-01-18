require_relative './label'
require_relative './module_methods/music_genre'
require_relative './music_album'
require_relative './genre'
require_relative './books'
require_relative './author'
require_relative './game'
require_relative './module_methods/game_data'

class App
  include MusicGenreModule
  include GameData
  def initialize
    @music_albums = []
    @genres = []
    show_genres
    @authors = []
    @games = read_game
  end

  def list_all_books
    puts 'books Listed'
  end

  def list_all_music_albums
    list_all_music_albums_music_module
  end

  def list_all_games
    if @games.empty?
      puts 'No recorded games yet!'
      puts
    else
      @games.each do |game|
        puts "Multiplayer: #{game['multiplayer']}, Last Played Date: #{game['last_played_at']}"
      end
    end
  end

  def list_all_genres
    list_all_genres_music_module
  end

  def list_all_labels
    puts 'Label Listed'
  end

  def list_all_authors
    if @authors.empty?
      puts 'You have No recorded authors yet! '
      puts
    else
      @authors.each do |author|
        puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
      end
    end
  end

  def add_label(thing)
    print "Title of the #{thing}: "
    title = gets.chomp
    print "Color of the #{thing}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_author
    puts 'Enter Author\'s Id:'
    id = gets.chomp
    puts 'Enter Author\'s First Name:'
    first_name = gets.chomp
    puts 'Enter Author\'s Last Name:'
    last_name = gets.chomp
    author = Author.new(id, first_name, last_name)
    @authors << author
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
    puts 'Enter Multiplayer:'
    multiplayer = gets.chomp
    puts 'Enter last played date:'
    last_played_date = gets.chomp
    game = Game.new(multiplayer, last_played_date)
    @games << {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at
    }
    puts 'Game Recorded!'
    write_game(@games)
  end

  def quit_app
    exit
  end
end
