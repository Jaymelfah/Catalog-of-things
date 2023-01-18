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
  context 'Archiving methods: ' do
    it 'can not use can_be_archived? since it\'s private' do
      expect(@book1).not_to respond_to(:can_be_archived?)
      expect(@book2).not_to respond_to(:can_be_archived?)
      expect(@book3).not_to respond_to(:can_be_archived?)
    end
    it 'can use move_to_archive method since it\'s privare' do
      expect(@book1).to respond_to(:move_to_archive)
      expect(@book2).to respond_to(:move_to_archive)
      expect(@book3).to respond_to(:move_to_archive)
    end
    it '@book3 cannot be achieved; publish_date diff < 10 and cover_state=good' do
      archived = @book3.archived
      @book3.move_to_archive
      expect(@book3.archived).to eql archived
      expect(@book2.archived).to be_falsey
      expect(@book2.archived).to be_falsey
    end
    it 'can_be_achieved for @book2 to true; cover_state is good but publish_date diff > 10' do
      archived = @book2.archived
      @book2.move_to_archive
      expect(@book2.archived).not_to eq archived
      expect(@book2.archived).to be_truthy
    end
    it 'can_be_achieved for @book1 to true; cover_state is bad ' do
      archived = @book3.archived
      @book3.move_to_archive
      expect(@book3.archived).to eql archived
      expect(@book3.archived).to be_falsey
    end
  end
end