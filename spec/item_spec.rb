require './lib/item'
require './lib/auction'
require './lib/item'

Respec.describe 'item' do
    before(:each) do
        Item.new({name: 'Chalkware Piggy Bank'})
        Item.new({name: 'Bamboo Picture Frame'})
    end
    
    it 'exist to be an item' do
        expect(@item).to be_an(item)
    end

    describe ''
end