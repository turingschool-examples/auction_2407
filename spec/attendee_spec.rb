require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Attendee do
    before(:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    describe 'initialize' do
        it 'exists' do
            expect(@attendee).to be_an_instance_of Attendee
        end

        it 'has a name' do
            expect(@attendee.name).to eq 'Megan'
        end

        it 'has a budget' do
            expect(@attendee.budget).to eq '$50'
        end

        it 'has a hash for items bid on' do
            expect(@attendee.items).to eq({})
        end
    end
end
