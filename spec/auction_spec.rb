require './lib/auction'
require './lib/item'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe 'Auction' do
    it 'exists' do
        @auction = Auction.new

        expect(@auction).to be_a(Auction)
    end

    it 'starts w/ no items in an empty array' do
        @auction = Auction.new

        expect(@auction.items).to eq([])
    end
    describe '#add_item' do
        it 'can add items to the items array' do
            @auction = Auction.new
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')

            @auction.add_item(@item1)
            @auction.add_item(@item2)

            expect(@auction.items).to eq([@item1, @item2])
        end
    end
    describe '#item_names' do
        it 'lists the items added to the items array' do
            @auction = Auction.new
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')

            @auction.add_item(@item1)
            @auction.add_item(@item2)

            expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
        end
    end

    describe '#unpopular_items' do
        it 'displays items with no bids' do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')
            @item3 = Item.new('Homemade Chocolate Chip') 
            @item4 = Item.new('2 Days Dogsitting')
            @item5 = Item.new('Forever Stamps')
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            @auction = Auction.new

            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
    
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
        end
    end

    describe '#potential_revenue' do
        it 'calculates potential revenue for current highest bids' do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')
            @item3 = Item.new('Homemade Chocolate Chip') 
            @item4 = Item.new('2 Days Dogsitting')
            @item5 = Item.new('Forever Stamps')
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            @auction = Auction.new

            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
    
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.potential_revenue).to eq 72
        end
    end

    describe '#bidders' do
        it 'returns an array of attendees(as a string) who have bidded' do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item4 = Item.new('2 Days Dogsitting')
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            @auction = Auction.new

            @auction.add_item(@item1)
            @auction.add_item(@item4)
    
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.bidders).to eq(['Bob', 'Megan', 'Mike'])
        end
    end

    describe '#bidder_info' do
        it 'returns hash w (k)attendees and (v)being a subhash of (k)budget and (v)items' do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item4 = Item.new('2 Days Dogsitting')
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            @auction = Auction.new

            @auction.add_item(@item1)
            @auction.add_item(@item4)
    
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.bidder_info).to eq
        end
    end
end
