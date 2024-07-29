require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@auction).to be_an_instance_of Auction
        end

        it "contains an array for items, since no items, it should be empty" do
            expect(@auction.items).to eq([])
        end

    end

end