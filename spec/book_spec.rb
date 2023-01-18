require_relative '../src/books'

describe 'Book Class Unit test: ' do
  before :each do
    @book1 = Book.new('Macmillan.', 'bad', '1983/01/23')
    @book2 = Book.new('Simon & Schuster', 'good', '2006/03/01')
    @book3 = Book.new('Penguin Random House', 'good', '2021/12/10')
  end

  context 'When creating a new Book' do
    it 'should have the following attributes (publisher, cover_state and parents props)' do
      expect(@book2.publisher).to eql 'Simon & Schuster'
      expect(@book1.cover_state).to eql 'bad'
      expect(@book2.id).to be_kind_of String
      expect(@book1.archived).to be_kind_of FalseClass
      expect(@book2.publish_date).to eql '2006/03/01'
    end
    it 'should be an instance of the class Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
    end
  end
  
end