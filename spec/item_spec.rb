require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    before(:each) do
        @auction = Auction.new
         
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')

        @auction.add_item(@item1)
        @auction.add_item(@item2)
        @auction.add_item(@item3)
        @auction.add_item(@item4)
        @auction.add_item(@item5)

        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    describe 'initialize' do 
        it 'exists' do
            expect(@item1).to be_an_instance_of Item
        end

        it 'has a name' do
            expect(@item1.name).to eq 'Chalkware Piggy Bank'
        end

        it 'has an empty hash for bids' do
            expect(@item1.bids).to be_a Hash
        end
    end

    describe 'bids' do
        it 'can add bids' do
            expect(@item1.bids).to eq({})
            
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            
            expect(@item1.bids).to eq({
                @attendee1 => 22,
                @attendee2 => 20
            })
        end

        it 'can track current high bid' do
            expect(@item1.bids).to eq({})
            
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)

            expect(@item1.current_high_bid).to eq 22
        end

        it 'can track unpopular bids' do
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq @item2, @item3
        end
    end

end