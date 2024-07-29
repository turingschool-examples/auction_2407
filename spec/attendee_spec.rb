require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Attendee do
    it 'has a name and budget' do
        attendee = Attendee.new({name: 'Megan', budget: '$50'})

        expect(attendee.name).to eq('Megan')
        expect(attendee.budget).to eq('$50')
    end
end