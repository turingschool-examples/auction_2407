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
    end
end 