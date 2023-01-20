require_relative './label'
require_relative './module_methods/music_genre'
require_relative './module_methods/book'
require_relative './module_methods/label'
require_relative './music_album'
require_relative './genre'
require_relative './books'
require_relative './author'
require_relative './game'
require_relative './module_methods/game_data'
require_relative './module_methods/author'

class App
  include MusicGenreModule
  include GameData
  include LabelModule
  include BookModule
  include AuthorModule

  def initialize
    @music_albums = []
    @genres = []
    show_genres
    @authors = read_authors
    @games = read_game
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
    list_labels(@labels)
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

  def add_author
    puts 'Enter Author\'s First Name:'
    first_name = gets.chomp
    puts 'Enter Author\'s Last Name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    store_author(@authors)
    author
  end

  def add_label(thing)
    print "#{thing} Title: "
    title = gets.chomp
    print "#{thing} Color: "
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    store_label(@labels)
    label
  end

  def add_book
    label = add_label('Book')
    author = add_author
    print 'Book Cover Status - [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Book Publisher: '
    publisher = gets.chomp
    print 'Publishing date - [year/month/day]: '
    published_date = gets.chomp
    book = Book.new(publisher, cover_state, published_date)
    label.add_item(book)
    author.add_item(book)
    @books << book
    store_books(@books)
    puts "\n The book '#{label.title}' was created successfully!✅ "
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
