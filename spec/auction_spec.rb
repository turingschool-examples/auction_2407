require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Auction do
    it 'has no items' do
        auction = Auction.new

        expect(auction.items).to eq([])
    end

    it 'has two items with names' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.items).to eq([item1, item2])
        expect(auction.item_names(:name)).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end

    it 'has no bids' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')

        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)

        item1.bids

        expect(item1.bids).to eq({})
    end

    it 'has two bids' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')

        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)

        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)

        expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end
      
   
end