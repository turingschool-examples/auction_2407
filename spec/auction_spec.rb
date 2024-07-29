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
  describe '#initialize' do 
    it 'has not items' do 
      expect(@auction.items).to eq([])
    end

    it 'can add items' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to include(@item1, @item2)
    end

    it 'gives me back the item names' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end

  describe 'unpopular items' do 
    it 'finds unpopular items' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to contain_exactly(@item2, @item3, @item5)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to contain_exactly(@item2, @item5)
    end
  end

  describe 'potential revenue' do 
    it 'calculates revenue' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe 'bidder_info' do 
    it 'returns info on the bidders name' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 30)
      @item2.add_bid(@attendee3, 50)
      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end

    it 'returns bidders info' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 30)
      @item2.add_bid(@attendee3, 50)
      info = {
        @attendee1 => { budget: 50, items: [@item1] },
        @attendee2 => { budget: 75, items: [@item1] },
        @attendee3 => { budget: 100, items: [@item2] }
      }
      expect(@auction.bidder_info).to eq(info)
    end
  end
end