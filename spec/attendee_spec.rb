require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
    before(:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@attendee).to be_an_instance_of(Attendee)
        end

        it 'has a name' do
            expect(@attendee.name).to be("Megan")
        end
    end
end