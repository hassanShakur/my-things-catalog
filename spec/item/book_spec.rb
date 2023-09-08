require_relative '../../classes/item/book'

describe Book do
  before :each do
    @book = Book.new('Moran Publishers', 'bad', '2020')
  end

  describe '#new' do
    it 'takes 3 params and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end
end
