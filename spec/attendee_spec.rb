require './lib/attendee'

Respec.describe 'Attendee' do
    before(:each) do
        @attendee = attendee
    end

    it 'exist' do
        expect(@attendee). to be_an(attendee)

end
