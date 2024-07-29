require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
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
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@item1).to be_an_instance_of(Item)
        end

        it 'has a name' do
            expect(@item1.name).to eq("Chalkware Piggy Bank")
        end

        it 'has bids' do
            expect(@item1.bids).to eq({})
        end
    end

    describe '#add_bid' do
        it 'can add bids to the item bids hash' do
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            expect(@item1.bids).to eq({@attendee1=>22, @attendee2=>20})
        end
    end

    describe '#current_high_bid' do
        it 'shows the highest bid for the item' do
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            expect(@item1.current_high_bid).to eq(22)
        end
    end
end