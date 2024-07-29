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
            expect(@auction.items).to eq([@item1, @item2])
        end
    end

    describe 'item_names' do
        it 'can display the item names in auction' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
        end
    end
end

