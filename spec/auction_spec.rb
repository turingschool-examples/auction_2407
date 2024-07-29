require './lib/auction'
require './lib/item'

RSpec.describe Auction do 
  describe '#initialize' do 
    it 'has not items' do 
      auction = Auction.new
      expect(auction.items).to eq([])
    end

    it 'can add items' do 
      auction = Auction.new
      item_1 = Item.new('Chalkware Piggy Bank')
      item_2 = Item.new('Bamboo Picture Frame')
      auction.add_item(item_1)
      auction.add_item(item_2)
      expect(auction.items).to eq(item_1, item_2)
    end
  end
end