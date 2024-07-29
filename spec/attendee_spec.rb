require './lib/attendee'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe 'Attendee' do
    it 'exists' do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})

        expect(@attendee).to be_a(Attendee)
    end

    it 'has a name' do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})

        expect(@attendee.name).to eq('Megan')
    end

    it 'has a budget' do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})

        expect(@attendee.budget).to eq 50
    end

end