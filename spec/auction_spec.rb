require './lib/auction'
require './lib/item'
require '.lib/attendee'

RSpec.describe do
    # it 'is an auction' do
    #     auction = Auction.new
    # end

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
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        expect(item3.name).to eq('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        expect(item4.name).to eq('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')
        expect(item5.name).to eq('Forever Stamps')
    end

    it 'has attendees' do

    end

    it 'has bidding' do

    end

    it 'has unpopular items' do

    end

    it 'has potential revenue' do
        
    end
end