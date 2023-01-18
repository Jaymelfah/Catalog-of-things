require_relative '../books'
require_relative '../label.rb'
require_relative '../genre.rb'
require_relative './label.rb'
require_relative './music_genre.rb'
require_relative '../storage_helper_methods/storage'

module BookModule

  include Storage
  include LabelModule
  include MusicGenreModule

  def list_books(books)
    if books.empty?
      puts "\n Your Books list is empty"
    else
      puts "\n Books list - count(#{books.count}):"
      puts "-----------------------------------------\n"

      books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.label.title}'",
            #  "   Author: #{book.author.first_name}, #{book.author.last_name} ",
             "   Publisher: #{book.publisher}",
             "   Cover State: #{book.cover_state}"
      end
    end
  end

  def store_books(books)
    books_array = []
    books.each do |book|
      books_array << {
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        publisher: book.publisher,
        id: book.id,
        label: {
          title: book.label.title,
          color: book.label.color,
          id: book.label.id
        },
        # author: {
        #   first_name: book.author.first_name,
        #   last_name: book.author.last_name,
        #   id: book.author.id
        # },
        # genre: {
        #   name: book.genre.name,
        #   id: book.genre.id
        # }
      }
    end
    return if books_array.empty?
    store_data(books_array, './src/data/books.json')
  end

  def get_books
    books = []
    data = get_data('./src/data/books.json') 
    data.each do |book|
      new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['id'])
      label = Label.new(book['label']['title'], book['label']['color'], id: book['label']['id'])
      # genre = Genre.new(book['genre']['name'], id: book['genre']['id'])
      # author = Author.new(book['author']['first_name'], book['author']['last_name'],id: book['author']['id'])
      new_book.label = label
      # new_book.genre = genre
      # new_book.author = author
      books << new_book
    end
    books
  end
end
