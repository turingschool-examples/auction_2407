require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end

  describe 'initialize' do
    it 'exists' do
      expect(@item1).to be_an_instance_of Item 
    end

    it 'has attributes' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to eq({})
    end
  end

  describe '#close_bidding' do
    it 'returns true of biddable' do
      expect(@item5.biddable).to be true
    end

    it 'returns false of biddable' do
      expect(@item5.biddable).to be true
      @item5.close_bidding
      
      expect(@item5.biddable).to be false
    end
  end

end