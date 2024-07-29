require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
    before(:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
        @item1 = Item.new('Chalkware Piggy Bank')
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@attendee).to be_an_instance_of(Attendee)
        end

        it 'has a name' do
            expect(@attendee.name).to eq("Megan")
        end

        it 'has a budget' do
            expect(@attendee.budget).to eq(50)
        end

        it 'has bids' do
            expect(@attendee.bids).to eq([])
        end
    end

    describe '#add_bids' do
        it 'adds bids to the bids array' do
            @attendee.add_bids(@item1)
            expect(@attendee.bids).to eq(['Chalkware Piggy Bank'])
        end
    end
end