require './lib/auction'
require './lib/item'


RSpec.describe Auction do
  before(:each) do
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
  end
end