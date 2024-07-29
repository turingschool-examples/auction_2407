require './lib/auction'

RSpec.describe Auction do
    describe 'initialize' do
        it 'exists' do
            expect(Auction.new).to be_a Auction
        end

        it 'starts with an empty array of items' do
            auction = Auction.new

            expect(auction.items).to eq []
        end
    end
end