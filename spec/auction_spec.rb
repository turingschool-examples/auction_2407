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

  it 'has no items' do
    expect(@auction.items).to eq([])
  end

  it 'can add items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1, @item2])
  end

  it 'can list item names' do 
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end
end
