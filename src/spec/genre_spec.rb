require_relative '../genre'
require_relative '../music_album'

describe 'tests for genre class"' do
  context 'Given an instance of the genre class' do
    before :each do
      @genre = Genre.new('Afrobeat')
    end

    it 'creates an instance of the music album class' do
      expect(@genre).to be_instance_of Genre
    end

    it 'increase array length of items' do
      music = MusicAlbum.new(true, '2013/09/03')
      @genre.add_item(music)
      expect(@genre.items.length).to be 1
    end
  end
end
