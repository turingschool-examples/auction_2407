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
end

