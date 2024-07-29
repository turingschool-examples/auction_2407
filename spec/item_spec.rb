require './lib/item'
require './lib/attendee'

RSpec.describe Item do
    describe 'initialize' do
        it 'exists' do
            expect(Item.new('Chalkware Piggy Bank')).to be_a Item
        end

        it 'has attributes name' do
            item1 = Item.new('Chalkware Piggy Bank')

            expect(item1.name).to eq 'Chalkware Piggy Bank'
        end

        it 'can take different names' do
            item2 = Item.new('Bamboo Picture Frame')
            
            expect(item2.name).to eq 'Bamboo Picture Frame'
        end

        it 'starts with an empty hash for tracking bids' do
            item1 = Item.new('Chalkware Piggy Bank')

            expect(item1.bids).to be_a Hash
        end
    end

    describe '#add_bid' do
        it 'adds a bid to the hash' do
            item1 = Item.new('Chalkware Piggy Bank')
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            expect(item1.bids.count).to eq 0

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)
            expect(item1.bids.count).to eq 2
            expect(item1.bids).to eq ({attendee2 => 20, attendee1 => 22}) 
        end

        it 'has a bid with an attendee and amount' do
        end
    end
end