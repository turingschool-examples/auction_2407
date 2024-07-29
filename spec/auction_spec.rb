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
    it 'can access item bids' do
      @auction.add_item(@item1)

      expect(@item1.bids).to eq({})
    end

    it 'adds bids' do
      expect(@item1.bids).to eq({})
      @auction.add_item(@item1)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expected = {
        @attendee2 => 20,
        @attendee1 => 22
      }

      expect(@item1.bids).to eq(expected)
    end

    it 'returns items with no bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expected = [@item2, @item3, @item5]

      expect(@auction.unpopular_items).to eq(expected)
    end

    it 'can update unpopular items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      mid_auction_expected = [@item2, @item3, @item5]

      expect(@auction.unpopular_items).to eq(mid_auction_expected)

      @item3.add_bid(@attendee2, 15)
      expected = [@item2, @item5]

      expect(@auction.unpopular_items).to eq(expected)
    end
  end

  describe '#revenue' do
    it 'returns revenue' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq 87
    end
  end
end