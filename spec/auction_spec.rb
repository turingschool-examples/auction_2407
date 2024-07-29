require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
    end

    describe 'initialize' do
        it 'exists' do
            expect(@auction).to be_an_instance_of Auction
        end

        it 'has an empty array for auction items' do
            expect(@auction.items).to eq []
        end
    end
end 