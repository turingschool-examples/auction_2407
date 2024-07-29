require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'starts with attributes' do
      expect(@auction).to be_an_instance_of(Auction)
      expect(@auction.items).to eq([])
    end
  end

    it 'adds auction items' do
      
    end
end