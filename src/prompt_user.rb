require_relative './app'
require_relative './options'
require_relative './menu'
class PromptUser
  def prompt_user(app)
    Menu.new.display_menu
    options = gets.chomp.to_i

    Options.new.option_case(app, options)
    prompt_user(app)
  end
end
