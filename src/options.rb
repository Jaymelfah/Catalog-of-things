class Options
  def option_case(app, option)
    case option
    when 1..6
      list_all(app, option)
    when 7..9
      add_options(app, option)
    when 0
      app.quit_app
    else
      puts 'incorrect menu Option, Please check again'
    end
  end

  def list_all(app, option)
    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_music_albums
    when 3
      app.list_all_games
    when 4
      app.list_all_genres
    when 5
      app.list_all_labels
    when 6
      app.list_all_authors
    end
  end

  def add_options(app, option)
    case option
    when 7
      app.add_book
    when 8
      app.add_music_album
    when 9
      app.add_game
    end
  end
end
