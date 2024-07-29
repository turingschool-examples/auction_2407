require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Item do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end

  describe '#initialize' do
    it 'starts with attributes' do
      expect(@item1).to be_an_instance_of(Item)
      expect(@item2).to be_an_instance_of(Item)
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end

    it 'adds more auction items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      expect(@item1.bids).to eq({})
    end

    it 'adds bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      item1_bids = {@attendee2 => 20, @attendee1 => 22}

      expect(@item1.bids).to eq(item1_bids)
    end

    it 'identifies the current high bid' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq(22)
    end . 
    
    # xit 'does not accept additional bids' do
    #   expect(@item1.close_bidding).to eq()
    # end
  end