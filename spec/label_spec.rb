require_relative '../classes/label'
require_relative '../classes/item/item'

describe Label do
  before :each do
    @label = Label.new('Interesting', 'Green')
    @item = Item.new(2020)
  end

  describe '#new' do
    it 'takes 2 params & returns a Label instance' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@label.title).to eq('Interesting')
      expect(@label.color).to eq('Green')
    end
  end

  describe '#add_item' do
    it 'adds itself to an item\'s label property' do
      @label.add_item(@item)
      expect(@item.label).to eql(@label)
    end
  end
end
