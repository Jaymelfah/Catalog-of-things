class Menu
  attr_reader :options
  def initialize
    @options = [
      '1 - List all Books', 
      '2 - List all Music Albums',
      '3 - List all Games',
      '4 - List all Genres',
      '5 - List all Labels',
      '6 - List all authors',
      '7 - Add a Book', 
      '8 - Add a Music Album',
      '9 - Add a Game',
      '0 - Exit app'
    ]
  end

  def display_menu
    puts 'Welcome to Catalog of your Items'
    puts '\n Please Choose an option by entering a Number'
    puts @options
  end
  
end