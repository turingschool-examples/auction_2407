require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@auction).to be_an_instance_of Auction
        end

        it "contains an array for items, since no items, it should be empty" do
            expect(@auction.items).to eq([])
        end
    end

    describe 'add_item' do
        it 'can add items' do
            auction.add_item(@item1)
            auction.add_item(@item2)

            expect(@auction.items).to eq([@item1, @item2])
        end
    end

end