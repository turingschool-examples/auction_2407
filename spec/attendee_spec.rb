require './lib/attendee'

RSpec.describe '#attendee' do
    it 'is an attendee' do
        attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    describe '#name' do
        it 'has a name' do
            attendee = Attendee.new({name: 'Megan', budget: '$50'})
            # expect(attendee.name).to eq('Megan')
            expect(attendee.name).to be_a(name)
        end
    end

    describe '#budget' do
        it 'has a budget' do
            attendee = Attendee.new({name: 'Megan', budget: '$50'})
            # expect(attendee.budget).to eq('$50')
            expect(attendee.budget).to be_a(budget)
        end
    end 
end