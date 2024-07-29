require './lib/auction'
require './lib/item'


RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @auction = Auction.new
  end

  describe '#initalize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of Auction
    end
  end

  describe '#items' do
    it 'has items' do
      expect(@auction.items).to eq([])
    end

    it 'can add items' do
      expect(@auction.items).to eq([])
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expected = [@item1, @item2]

      expect(@auction.items).to eq(expected)
    end

    it 'returns item names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expected = ['Chalkware Piggy Bank', 'Bamboo Picture Frame']

      expect(@auction.item_names).to eq(expected)
    end
  end
end