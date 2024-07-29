require './lib/attendee'

RSpec.describe Attendee do
    describe 'initialize' do
        it 'exists' do
            expect(Attendee.new({name: 'Megan', budget: '$50'})).to be_a Attendee
        end
    end
end