RSpec.describe Item do
    describe 'initialize' do
        it 'exists' do
            expect(Item.new('Chalkware Piggy Bank')).to be_a Item
        end

        it 'has attributes name' do
            item1 = Item.new('Chalkware Piggy Bank')

            expect(item1.name).to eq 'Chalkware Piggy Bank'
    end
end