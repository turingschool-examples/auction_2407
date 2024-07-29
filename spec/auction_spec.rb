require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@auction).to be_an_instance_of(Auction)
        end

        it 'has items' do
            expect(@auction.items).to eq([])
        end
    end
end