require './lib/item'
require './lib/auction'
require './lib/item'

Respec.describe 'item' do
    before(:each) do
        Item.new({name: 'Chalkware Piggy Bank'})
        Item.new({name: 'Bamboo Picture Frame'})
        Item.new([name: 'Homemade Chocolate Chip Cookies'])
        Item.new([name: '2 Days Dogsitting'])
        Item.new([name: 'Forever Stamps'])
    end
end