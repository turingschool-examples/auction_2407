require './lib/item'

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
  end
end