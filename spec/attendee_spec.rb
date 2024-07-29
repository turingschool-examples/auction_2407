require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
    before(:each) do
        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@attendee1).to be_an_instance_of Attendee
        end

        # it "stores names" do
        #     expect(@item1.name).to eq('Chalkware Piggy Bank')
        #     expect(@item2.name).to eq('Bamboo Picture Frame')
        # end
    end


    

end