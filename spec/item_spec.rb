require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
    end

    describe 'initialize' do 
        it 'exists' do
            expect(@item1).to be_an_instance_of Item
        end

        it 'has a name' do
            expect(@item1.name).to eq 'Chalkware Piggy Bank'
        end

        it 'has an empty hash for bids' do
            expect(@item1.bids).to be_a Hash
        end
    end
end