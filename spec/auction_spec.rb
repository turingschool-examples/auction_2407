require './lib/auction'
require './lib/item'

RSpec.describe Auction do 
  describe '#initialize' do 
    it 'has not items' do 
      auction = Auction.new
      expect(auction.items).to eq([])
    end
  end
end