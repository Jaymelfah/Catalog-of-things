require_relative '../src/music_album'

describe 'tests for music album class"' do
  context 'Given an instance of the music album class' do
    before :each do
      @music = MusicAlbum.new(true, '2013/09/03')
    end

    it 'creates an instance of the music album class' do
      expect(@music).to be_instance_of MusicAlbum
    end

    it 'return true for the can be archived method' do
      expect(@music.can_be_archived?).to be true
    end
  end
end
