require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Auction do
    describe 'how it deals with items' do
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
    end

    describe 'how it deals with bids' do
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
      
        it 'checks current high bid' do
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

            expect(item1.current_high_bid).to eq(22)

            item4.add_bid(attendee3, 50)
            expect(item4.current_high_bid).to eq(50)
        end
    end
   
    describe 'how it checks item popularity & potential revenue' do
        it 'checks current high bid' do
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
            item4.add_bid(attendee3, 50)

            expect(auction.unpopular_items).to eq([item2, item3, item5])

            item3.add_bid(attendee2, 15)

            expect(auction.unpopular_items).to eq([item2, item5])
        end

        it 'checks potential revenue' do
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

            item3.add_bid(attendee2, 15)
            item1.add_bid(attendee1, 22)
            item4.add_bid(attendee3, 50)

            expect(auction.potential_revenue).to eq(87)
        end
    end

    describe 'how it tracks bidders and their info' do
        it 'lists bidders' do
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
            item4.add_bid(attendee3, 50)
            item3.add_bid(attendee2, 15)

            expect(auction.bidders).to eq(['Bob', 'Megan', 'Mike'])
        end

        it 'lists bidders info' do
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
            item4.add_bid(attendee3, 50)
            item3.add_bid(attendee2, 15)

            expect(auction.bidder_info).to eq({attendee2 => {budget: '$75', items: [item1, item3]}, attendee1 => {budget: '$50', items: [item1]}, attendee3 => {budget: '$100', items: [item4]}})
        end
    end
    # `bidder_info` should return a hash with keys that are attendees, 
    # and values that are a hash with that attendee's budget and an 
    # array of items that attendee has bid on.
end