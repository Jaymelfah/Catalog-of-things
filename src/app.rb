require_relative './label'

class App
  def list_all_books
    puts 'books Listed'
  end

  def list_all_music_albums
    puts 'Music Album Listed'
  end

  def list_all_games
    puts 'games Listed'
  end

  def list_all_genres
    puts 'Genre Listed'
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

  def add_genre(thing)
    # thing can be Book, music or game
    # genre Properties
  end

  def add_book
    label = add_label('Book')
    author = add_author
    genre = add_genre('book')
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
    puts 'music Added'
  end

  def add_game
    puts 'Game Added'
  end

  def quit_app
    exit
  end
end
