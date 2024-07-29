require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
       
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')

        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    describe 'initialize' do
        it 'exists' do
            expect(@auction).to be_an_instance_of Auction
        end

        it 'has an empty array for auction items' do
            expect(@auction.items).to eq []
        end

        it 'can add items to auction items' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)

            expect(@auction.items).to eq [@item1, @item2]
        end

        it 'can name the items in items' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)

            expect(@auction.item_names).to eq ['Chalkware Piggy Bank', 'Bamboo Picture Frame']
        end
    end

    it 'can track unpopular bids' do
        @item1.add_bid(@attendee1, 22)
        @item1.add_bid(@attendee2, 20)
        @item4.add_bid(@attendee3, 50)

        expect(@auction.unpopular_items).to eq @item2, @item3
    end
    

    # @auction.add_item(item1)
    # @auction.add_item(item2)
    # @auction.add_item(item3)
    # @auction.add_item(item4)
    # @auction.add_item(item5)

end 