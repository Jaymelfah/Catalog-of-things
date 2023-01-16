require_relative './src/app'
require_relative './src/prompt_user.rb'
require_relative './src/menu.rb'

def main
  app = App.new
  PromptUser.new.prompt_user(app)
end

main
