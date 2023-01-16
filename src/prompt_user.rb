require_relative './app.rb'
require_relative './options.rb'
require_relative './menu.rb'
class PromptUser
  def prompt_user(app)
    Menu.new.display_menu
    options = gets.chomp.to_i

    Options.new.option_case(app, options)
    prompt_user(app)
  end
  
end