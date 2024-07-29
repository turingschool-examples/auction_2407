require './lib/attendee'

RSpec.describe Attendee do 
  describe '#initialize' do 
    before(:each) do 
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end
    it 'has a name an a budget' do 
      expect(attendee.name).to eq(:name)
      expect(attendee.budget).to eq(:budget)
    end
  end
end