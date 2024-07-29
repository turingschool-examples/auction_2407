require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Auction do
    it 'has a name' do
        auction = Auction.new

        expect(auction.items).to eq([])
    end

    it 'has a name' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        auction.add_item(item2)
        auction.add_item(item2)

        expect(auction.items).to eq([#<Item:0x00007fbda98fa1b0 ...>, #<Item:0x00007fbda91874f0 ...>])
    end
end