require './lib/item'
require './lib/attendee'

RSpec.describe Item do 
  describe '#initialize' do 
    it 'has a name' do
      item = Item.new('Chalkware Piggy Bank')
      expect(item.name).to eq("Chalkware Piggy Bank")
    end

    it 'has an empty hash' do 
      item = Item.new('Chalkware Piggy Bank')
      expect(item.bids).to eq({})
    end

    describe 'add bids' do 
      it 'adds bids' do 
        item = Item.new('Chalkware Piggy Bank')
        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        item.add_bid(attendee1, 20)
        item.add_bid(attendee2, 30)
        expect(item.bids).to eq({attendee1 => 20, attendee2 => 30})
      end
    end
  end
end