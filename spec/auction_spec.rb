require './lib/auction'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  describe '#initalize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of Auction
    end
  end
end