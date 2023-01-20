require_relative '../genre'
require_relative '../music_album'
require_relative '../storage_helper_methods/storage'

module MusicGenreModule
  include Storage

  def add_genre
    print 'Please type the name of the genre: '
    name = gets.chomp
    Genre.new(name)
  end

  def add_existing_genre
    list_all_genres_music_module
    puts 'Select index of genre: '
    index = gets.chomp.to_i
    @genres[index]
  end

  def create_new_music
    puts 'Is the music on spotify? [y/n]'
    input = gets.chomp
    case input
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    end
    puts 'Please type the publishing date of the music album(yyyy-mm-dd): '
    publish_date = gets.chomp
    MusicAlbum.new(on_spotify, publish_date)
  end

  def update_genre
    array = []
    @genres.each do |genre|
      array << {
        genre_id: genre.id,
        name: genre.name,
        items: genre.items.map do |item|
          {
            on_spotify: item.on_spotify,
            publish_date: item.publish_date
          }
        end
      }
    end
    update_data(array, './src/data/genres.json')
  end

  def show_genres
    data = get_data('./src/data/genres.json')
    data.each do |genre|
      new_genre = Genre.new(genre['name'])
      @genres << new_genre
      genre['items'].each do |item|
        new_genre.add_item(MusicAlbum.new(item['on_spotify'], item['publish_date']))
      end
    end
  end

  def add_music_album_music_module
    music = create_new_music
    puts 'Enter 1 for a new genre or 2 to choose an existing genre'
    genre = gets.chomp.to_i
    case genre
    when 1
      genre = add_genre
      @genres << genre.add_item(music)
      @music_albums << music
      update_genre
    when 2
      genre = add_existing_genre
      genre.add_item(music)
      @music_albums << music
      update_genre
    end
  end

  def list_all_music_albums_music_module
    puts 'No music albums saved yet' if @genres.empty?
    @genres.each_with_index do |genre, index|
      genre.items.each do |item|
        puts "#{index}:  Genre: '#{genre.name}',  On Spotify: '#{item.on_spotify}', Date: '#{item.publish_date}'"
      end
    end
  end

  def list_all_genres_music_module
    puts 'No genres available yet' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "#{index}:  Genre Name: '#{genre.name}'"
    end
  end
end
