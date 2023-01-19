require_relative '../author'
require_relative '../storage_helper_methods/storage'

module AuthorModule
  include Storage

  def store_author(authors)
    author = []
    authors.each do |item|
      author << {
        id: item.id,
        first_name: item.first_name,
        last_name: item.last_name
      }
    end
    return if authors.empty?

    update_data(author, './src/data/author.json')
  end

  def read_authors
    authors = []
    data = get_data('./src/data/authors.json')
    data.each do |item|
      author = Author.new(item['first_name'], item['last_name'], item['id'])
      authors << author
    end
    authors
  end
end
