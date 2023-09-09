require_relative '../classes/author'
require_relative '../classes/item/item'

describe Author do
  before :each do
    @author = Author.new('Jane', 'Doe')
    @item = Item.new(Time.now.year - 3)
  end

  describe '#new' do
    it 'takes 2 params & returns a Author instance' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@author.first_name).to eq('Jane')
      expect(@author.last_name).to eq('Doe')
    end
  end

  describe '#add_item' do
    it 'adds itself to an item\'s author property' do
      @author.add_item(@item)
      expect(@item.author).to eql(@author)
    end
  end
end
