require './lib/auction'
require './lib/item'
require './lib/attendee'



RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

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

  describe '#bids' do
    it 'returns bids' do
      @auction.add_item(@item1)

      expect(@item1.bids).to eq({})

    end
  end
end