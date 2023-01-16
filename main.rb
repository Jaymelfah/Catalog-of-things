require_relative './src/app'
require_relative './src/prompt_user'
require_relative './src/menu'

def main
  app = App.new
  PromptUser.new.prompt_user(app)
end

main
