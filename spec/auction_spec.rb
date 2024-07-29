require './lib/auction'
require './lib/item'
require './lib/attendee'

RSpec.describe Auction do
    describe 'initialize' do
        it 'exists' do
            expect(Auction.new).to be_a Auction
        end

        it 'starts with an empty array of items' do
            auction = Auction.new

            expect(auction.items).to eq []
        end
    end

    describe '#add item' do
        it 'can add items to array' do
            auction = Auction.new
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            expect(auction.items.count).to eq 0
            auction.add_item(item1)
            auction.add_item(item2)

            expect(auction.items.count).to eq 2
        end

        it 'reads back array of class Item' do
            auction = Auction.new
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            auction.add_item(item1)
            auction.add_item(item2)

            expect(auction.items[1]).to be_a Item
            expect(auction.items[0]).to be_a Item
        end

        it 'can return an array of just item names' do
            auction = Auction.new
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            auction.add_item(item1)
            auction.add_item(item2)

            expect(auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
        end
    end

    describe '#unpopular_items' do
        before(:each) do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')
            @item3 = Item.new('Homemade Chocolate Chip Cookies')
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
        end

        it 'lists items with no bids on them' do
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq ([@item2, @item3, @item5])
        end

        it 'can update as bids are placed' do
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq ([@item2, @item3, @item5])
            @item3.add_bid(@attendee2, 15)

            expect(@auction.unpopular_items).to eq ([@item2, @item5])
        end
    end

    describe '#potential_revenue' do
        before(:each) do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')
            @item3 = Item.new('Homemade Chocolate Chip Cookies')
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
        end

        it 'looks at all potential bids and totals up the bids' do
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)

            expect(@auction.potential_revenue).to eq 87
        end
    end

    describe '#bidders' do
        before(:each) do
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            @auction = Auction.new
        end

        it 'accepts each bidder into an array' do
            @auction.add_bidder(@attendee1)
            @auction.add_bidder(@attendee2)
            @auction.add_bidder(@attendee3)
            expect(@auction.bidders.count).to eq 3
        end

        it 'accepts just the name as a string' do
            @auction.add_bidder(@attendee1)
            @auction.add_bidder(@attendee2)
            @auction.add_bidder(@attendee3)
            expect(@auction.bidders).to eq ['Megan', 'Bob', 'Mike']
        end
    end

    describe '#bidder_info' do
        before(:each) do
            @item1 = Item.new('Chalkware Piggy Bank')
            @item2 = Item.new('Bamboo Picture Frame')
            @item3 = Item.new('Homemade Chocolate Chip Cookies')
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
        end

        it 'has a hash of attendees with their budget associated' do
            @auction.add_bidder(@attendee1)
            @auction.add_bidder(@attendee2)
            log = {@attendee1 => {budget: 50, items: []},
            @attendee2 => {budget: 75, items: []}}


            expect(@auction.bidder_info).to eq (log)
        end

        it 'shows items that attendees have bid upon within the info' do
            @auction.add_bidder(@attendee1)
            @auction.add_bidder(@attendee2)
            @auction.add_bidder(@attendee3)
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)
            log = {@attendee1 => {budget: 50, items: [@item1]},
            @attendee2 => {budget: 75, items: [@item1, @item3]},
            @attendee3 => {budget: 100, items: [@item4]}}

            expect(@auction.bidder_info).to eq log
        end
    end
end