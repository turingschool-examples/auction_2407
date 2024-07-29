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
        @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
        @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
        @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@auction).to be_an_instance_of(Auction)
        end

        it 'is an empty auction' do
            expect(@auction.items).to eq([])
        end
    end

    describe 'add_item' do
        it 'can add items to the auction' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            expect(@auction.items).to eq([@item1, @item2, @item3, @item4, @item5])
        end
    end

    describe 'item_names' do
        it 'can display the item names in auction' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 
                                               'Bamboo Picture Frame',
                                               'Homemade Chocolate Chip Cookies',
                                               '2 Days Dogsitting',
                                               'Forever Stamps'])
        end
    end

    describe 'unpopular_items' do
        it 'items with no bids' do
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

    describe 'potential_revenue' do
        it 'adds all highest bids for each item' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
      
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)
      
            expect(@auction.potential_revenue).to eq(87)
        end
    end

    describe 'bidders' do
        it 'lists the names of the bidders for all items' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
      
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)
      
            expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
        end
    end
end

