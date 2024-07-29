require './lib/item'

RSpec.describe do
    it 'is an item' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'has a name' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1.name).to eq('Chalkware Piggy Bank')
    end
end