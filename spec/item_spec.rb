require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config| 
 config.formatter = :documentation 
end

RSpec.describe Item do 
 before(:each) do 
  @item1 = Item.new('Chalkware Piggy Bank')
  @item2 = Item.new('Bamboo Picture Frame')
  @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
 end

 it 'exists' do
  expect(@item1).to be_an(Item)
 end

 it 'has attributes' do
  expect(@item1.name).to eq("Chalkware Piggy Bank")
 end

 it 'can have bids in a hash' do
  expect(@item1.bids).to eq({})
 end

 it 'can put bids in hash' do
  @item1.add_bid(@attendee2, 20)
  @item1.add_bid(@attendee1, 22)
  expected = {
    @attendee2 => 20,
    @attendee1 => 22
  }
  expect(@item1.bids).to eq(expected)
 end

 it 'can tell you current high bid' do
  @item1.add_bid(@attendee2, 20)
  @item1.add_bid(@attendee1, 22)
  expect(@item1.current_high_bid).to eq(22)
 end

 it 'can close bidding' do
  @item1.add_bid(@attendee2, 20)
  @item1.add_bid(@attendee1, 22)
  @item1.close_bidding

  @item1.add_bid(@attendee3, 50)

 expect(@item1.current_high_bid).to eq(22)
 end

end