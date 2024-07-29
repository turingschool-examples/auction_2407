require './lib/auction'
require './lib/item'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Auction do 
  before(:each) do 
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it 'exists' do 
    expect(@auction).to be_an_instance_of(Auction)
  end
end
