require './lib/item'

RSpec.describe Item do
    describe 'initialize' do
        it 'exists' do
            expect(Item.new('Chalkware Piggy Bank')).to be_a Item
        end

        it 'has attributes name' do
            item1 = Item.new('Chalkware Piggy Bank')

            expect(item1.name).to eq 'Chalkware Piggy Bank'
        end

        it 'can take different names' do
            item2 = Item.new('Bamboo Picture Frame')
            
            expect(item2.name).to eq 'Bamboo Picture Frame'
        end

        it 'starts with an empty hash for tracking bids' do
            item1 = Item.new('Chalkware Piggy Bank')

            expect(item1.bids).to be_a Hash
        end
    end
end