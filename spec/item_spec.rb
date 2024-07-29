require './lib/item'
require './lib/attendee'

RSpec.describe Item do 
  describe '#initialize' do 
    before(:each) do 
      @item = Item.new('Chalkware Piggy Bank')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    end
    it 'has a name' do
      
      expect(@item.name).to eq("Chalkware Piggy Bank")
    end

    it 'has an empty hash' do 
      expect(@item.bids).to eq({})
    end

    describe 'add bids' do 
      it 'adds bids' do 
        @item.add_bid(@attendee1, 20)
        @item.add_bid(@attendee2, 22)
        expect(@item.bids).to eq({@attendee1 => 20, @attendee2 => 22})
      end

      it 'has the highest bid' do 
        @item.add_bid(@attendee1, 20)
        @item.add_bid(@attendee2, 22)
        expect(@item.current_high_bid).to eq(22)
      end
    end
  end
end