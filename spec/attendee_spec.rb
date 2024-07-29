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
    end
end
