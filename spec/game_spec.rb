require_relative '../src/game'

describe 'tests for Game class"' do
  context 'Given an instance of the Game class' do
    before :each do
      @game = Game.new('Dagi', '2023')
    end

    it 'creates an instance of the Game class' do
      expect(@game).to be_instance_of Game
    end
  end
end
