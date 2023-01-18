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
    puts "\n\n"
    puts "
      ----------------------CATELOG OF MY-----------------------
      '########:'##::::'##:'####:'##::: ##::'######::::'######::
      ... ##..:: ##:::: ##:. ##:: ###:: ##:'##... ##::'##... ##:
      ::: ##:::: ##:::: ##:: ##:: ####: ##: ##:::..::: ##:::..::
      ::: ##:::: #########:: ##:: ## ## ##: ##::'####:. ######::
      ::: ##:::: ##.... ##:: ##:: ##. ####: ##::: ##:::..... ##:
      ::: ##:::: ##:::: ##:: ##:: ##:. ###: ##::: ##::'##::: ##:
      ::: ##:::: ##:::: ##:'####: ##::. ##:. ######:::. ######::
      :::..:::::..:::::..::....::..::::..:::......:::::......:::
      ----------BOOKS - GAMES - MUSIC_ALBUM - MOVIES------------


             Please choose an option by entering a number:
    "
    puts "\n", @options
  end
end
