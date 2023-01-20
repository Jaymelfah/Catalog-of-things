require_relative '../src/author'

describe 'Autor Class:' do
  before :each do
    @author = Author.new('Yismake', 'Worku')
    @book1 = Book.new('Macmillan.', 'bad', '1983/01/23')
    @book2 = Book.new('Simon & Schuster', 'good', '2006/03/01')
  end

  context 'New Author Class:' do
    it 'should have the following attributes (first name, last name, and id)' do
      expect(@author.first_name).to eql 'Yismake'
      expect(@author.last_name).to eql 'Worku'
    end
    it 'should be an instance of the class Author' do
      expect(@author).to be_instance_of Author
    end
  end

  context 'Add Book to an Author class #add_item Method' do
    it 'can use #add_item method' do
      expect(@author).to respond_to(:add_item)
    end
    it 'can add an item, items array length increases' do
      expect(@author.items.count).to eq 0
      @author.add_item(@book1)
      @author.add_item(@book2)
      expect(@author.items.count).to eq 2
    end
  end
end
