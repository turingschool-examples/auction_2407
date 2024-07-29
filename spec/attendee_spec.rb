require './lib/attendee'

RSpec.describe Attendee do
    describe 'initialize' do
        it 'exists' do
            expect(Attendee.new({name: 'Megan', budget: '$50'})).to be_a Attendee
        end

        it 'has attributes name and budget' do
            attendee = Attendee.new({name: 'Megan', budget: '$50'})

            expect(attendee.name).to eq 'Megan'
            expect(attendee.budget).to eq 50
        end

        it 'modifies budget string into integer' do
            attendee = Attendee.new({name: 'Megan', budget: '$50'})
            start_string = '$50'
            budget = attendee.budget_convert(start_string)

            expect(budget).to eq 50
        end

    end

end