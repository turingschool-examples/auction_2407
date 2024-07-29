require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Item do
    it 'has a name' do
        item1 = Item.new('Chalkware Piggy Bank')

        expect(item1.name).to eq('Chalkware Piggy Bank')
    end

end