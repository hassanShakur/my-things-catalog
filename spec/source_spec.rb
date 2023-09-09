require_relative '../classes/source'
require_relative '../classes/item/item'

describe Source do
  before :each do
    @source = Source.new('Online shop')
    @item = Item.new(Time.now.year - 3)
  end

  describe '#new' do
    it 'takes 1 param & returns a Source instance' do
      expect(@source).to be_an_instance_of Source
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@source.name).to eq('Online shop')
    end
  end

  describe '#add_item' do
    it 'adds itself to an item\'s source property' do
      @source.add_item(@item)
      expect(@item.source).to eql(@source)
    end
  end
end
