require './lib/auction'
require './lib/item'


RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  describe '#initalize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of Auction
    end
  end

  describe '#items' do
    it 'has items' do
      expect(@auction.items).to eq([])
    end
  end
end