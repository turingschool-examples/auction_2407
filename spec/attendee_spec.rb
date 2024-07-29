require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Attendee do
    before(:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@attendee).to be_an_instance_of(Attendee)
        end

        it 'has a name' do
            expect(@attendee.name).to eq('Megan')
        end

        it 'has a budget' do
            expect(@attendee.budget).to eq(50)
        end
    end
end