require './lib/attendee'

RSpec.describe Attendee do 
  describe '#initialize' do 
    it 'has a name an a budget' do 
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      expect(attendee.name).to eq('Megan')
      expect(attendee.budget).to eq(50)
    end
  end
end