require './lib/item'
require './lib/auction'
require './lib/attendee'

Respec.describe 'Auction' do
    before(:each) do
        @items = []
        @attendee = attendee
        @auction = Auiction.new
    end

    describe 'added_items' do
        it 'can add items' do
            expect (@auction.added_items).to be true
        end

        it 'adds items to the auction' do
            expect (@auciton.added_item). to be
        end
    end
end