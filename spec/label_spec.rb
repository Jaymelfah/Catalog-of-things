require_relative '../src/label'

describe "Label Class:" do
  before :each do
    @label = Label.new('Animal Farm', 'whitesmoke')
    @book1 = Book.new('Macmillan.', 'bad', '1983/01/23')
    @book2 = Book.new('Simon & Schuster', 'good', '2006/03/01')
  end

  context 'New Label Class:' do
    it 'should have the following attributes (title, color and id)' do
      expect(@label.title).to eql 'Animal Farm'
      expect(@label.color).to eql 'whitesmoke'
      expect(@label.id).to be_kind_of String
    end
    it 'should be an instance of the class Label' do
      expect(@label).to be_instance_of Label
    end
  end

  
end