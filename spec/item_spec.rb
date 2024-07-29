require './lib/item'
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
  end

  it 'exists' do
    expect(@item1).to be_an_instance_of(Item)
  end

  it 'has a name' do
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item2.name).to eq('Bamboo Picture Frame')
  end

  it 'does not have bids' do
    expect(@item1.bids).to eq({})
    expect(@item2.bids).to eq({})
  end

  it 'can add bids' do 
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected_bids = {
      @attendee2 => 20,
      @attendee1 => 22
    }

    expect(@item1.bids).to eq(expected_bids)
  end

  it 'can get the current high bid' do 
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
  end
end