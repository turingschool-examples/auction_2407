require './lib/item'
require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end

  describe 'initialize' do
    it 'exists' do
      expect(@item1).to be_an_instance_of Item 
    end

    it 'has attributes' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to eq({})
    end
  end

  describe '#bidding' do
    it 'returns highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq 22
    end
  end

  describe '#close_bidding' do
    it 'returns true of biddable' do
      expect(@item5.biddable).to be true
    end

    it 'returns false of biddable' do
      expect(@item5.biddable).to be true
      @item5.close_bidding
      
      expect(@item5.biddable).to be false
    end

    it 'can close bidding on item' do
      @item4.add_bid(@attendee3, 50)
      expect(@item4.current_high_bid).to eq 50
      @item4.close_bidding
      closed_message = "Bidding is closed for this item"

      expect(@item4.add_bid(@attendee2, 60)).to eq(closed_message)
      expect(@item4.current_high_bid).to eq 50
    end
  end
end