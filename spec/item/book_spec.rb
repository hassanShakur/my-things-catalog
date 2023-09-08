require_relative '../../classes/item/book'

describe Book do
  before :each do
    @book = Book.new('Moran Publishers', 'bad', 2020)
  end

  describe '#new' do
    it 'takes 3 params and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@book.cover_state).to eq('bad')
      expect(@book.publisher).to eq('Moran Publishers')
    end
  end

  describe '#move_to_archive' do
    it 'sets archived true if in bad state' do
      archive_status = @book.move_to_archive
      expect(archive_status).to eq(true)
    end

    it 'sets archived true if in older than 10 years' do
      @book = Book.new('Test pub', 'good', 2001)
      archive_status = @book.move_to_archive
      expect(archive_status).to eq(true)
    end

    it 'sets archived false if book in good state & younger than 10 yrs' do
      @book = Book.new('Test pub', 'good', Time.now.year - 4)
      expect(@book.move_to_archive).to eq(false)
    end
  end
end
