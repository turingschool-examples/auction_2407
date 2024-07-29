require 'spec_helper'

RSpec.describe Attendee do
    before (:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    describe '#initialize()' do
        it 'is an instance of an Attendee' do
            expect(@attendee).to be_a(Attendee)
        end

        it 'has a name' do
            expect(@item1.name).to eq('Megan')
        end

        it 'has a budget' do
            expect(@attendee.budget).to eq(50)
        end
    end
end