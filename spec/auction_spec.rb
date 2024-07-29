require './lib/auction'
require './lib/item'

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

    describe '#add_bid' do
        before(:each) do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
            auction = Auction.new
            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)
        end

        it 'adds a bid to the item hash' do
            
        end

        it 'has a bid with an attendee and amount' do
        end
    end
end