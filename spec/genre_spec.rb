require_relative '../classes/genre'
require_relative '../classes/item/item'

describe Genre do
  before :each do
    @genre = Genre.new('RNB')
  end

  describe '#new' do
    it 'takes 1 argument and returns a Genre instance' do
      expect(@genre).to be_an_instance_of Genre
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@genre.name).to eq('RNB')
    end
  end

  describe '#add_item' do
    it "adds itself to an item's genre property" do
      @item = Item.new(2020)
      @genre.add_item(@item)
      expect(@item.genre).to eql(@genre)
    end
  end
end
