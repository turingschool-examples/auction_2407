require './lib/item'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

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
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@item1).to be_an_instance_of(Item)
            expect(@item2).to be_an_instance_of(Item)
            expect(@item3).to be_an_instance_of(Item)
            expect(@item4).to be_an_instance_of(Item)
            expect(@item5).to be_an_instance_of(Item)
        end

        it 'has a name' do
            expect(@item1.name).to eq('Chalkware Piggy Bank')
            expect(@item2.name).to eq('Bamboo Picture Frame')
            expect(@item3.name).to eq('Homemade Chocolate Chip Cookies')
            expect(@item4.name).to eq('2 Days Dogsitting')
            expect(@item5.name).to eq('Forever Stamps')
        end

        it 'starts with no bids' do
            expect(@item1.bids).to eq({})
            expect(@item2.bids).to eq({})
            expect(@item3.bids).to eq({})
            expect(@item4.bids).to eq({})
            expect(@item5.bids).to eq({})
        end
    end

    describe 'add_bid' do
        it 'can add a bid' do
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
        end

        it 'what is the highest bid?' do
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            expect(@item1.current_high_bid).to eq(22)
        end
    end

    describe 'close_bidding' do
        it 'item can not be bid on after closing' do
            @item1.add_bid(@attendee1, 22)
            @item1.close_bidding
            @item1.add_bid(@attendee2, 25)
            expect(@item1.bids).to eq({ @attendee1 => 22 })
        end
    end
end