require './lib/auction'
require './lib/item'

RSpec.describe do
    it 'is an auction' do
        auction = Auction.new
    end

    it 'has items' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1).to be_a(Item)
        item2 = Item.new('Bamboo Picture Frame')
        expect(item2).to be_a(Item)
    end

    it 'has item names' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1.name).to eq('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        expect(item2.name).to eq('Bamboo Picture Frame')
    end
end