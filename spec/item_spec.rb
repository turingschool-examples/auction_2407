require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe 'Item' do
    it 'exists' do
        @item1 = Item.new('Chalkware Piggy Bank')

        expect(@item1).to be_a(Item)
    end

    it 'has a name' do
        @item1 = Item.new('Chalkware Piggy Bank')

        expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'stores bids in a hash that starts empty' do
        @item1 = Item.new('Chalkware Piggy Bank')

        expect(@item1.bids).to eq({})
    end

    describe '#add_bid' do
    it 'adds attendee/bids in bids hash' do
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

        expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})

        @item4.add_bid(@attendee3, 10)

        expect(@item4.bids).to eq({@attendee3 => 10})
    end

    describe '#current_high_bid' do
        it 'displays what the highest bid for an item is' do
            @item1 = Item.new('Chalkware Piggy Bank')
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
            @auction = Auction.new

            @auction.add_item(@item1)
            
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
    
            expect(@item1.current_high_bid).to eq 22
        end
    end
end

end
