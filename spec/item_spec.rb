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
    end

    describe '#current_high_bid' do
        it 'tracks the highest bid' do
            item1 = Item.new('Chalkware Piggy Bank')
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            expect(item1.current_high_bid).to eq 0
            
            item1.add_bid(attendee2, 20)
            expect(item1.current_high_bid).to eq 20

            item1.add_bid(attendee1, 22)
            expect(item1.current_high_bid).to eq 22
        end
    end

    describe '#close_bidding' do
        it 'toggles a class attribute off when called' do
            item1 = Item.new("Chalkware Piggy Bank")
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            expect(item1.closed?).to eq false

            item1.close_bidding
            expect(item1.closed?).to eq true
        end

        it 'accepts bids while open' do
            item1 = Item.new("Chalkware Piggy Bank")
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            item1.add_bid(attendee1, 22)

            expect(item1.bids.count).to eq 1
        end

        it 'doesnt accept bids when closed' do
            item1 = Item.new("Chalkware Piggy Bank")
            attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            item1.close_bidding
            expect(item1.closed?).to eq true
            item1.add_bid(attendee1, 22)

            expect(item1.bids.count).to eq 0
        end
    end
end