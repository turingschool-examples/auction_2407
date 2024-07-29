require 'spec_helper'

RSpec.describe Auction do
    before (:each) do
        @auction = Auction.new
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
    end

    describe '#initialize' do

        it 'is an instance of an Auction' do
            expect(@auction).to be_a(Auction)
        end

        it 'has an items array initialized as empty' do
            expect(@auction.items).to eq([])
        end
    end

    describe '#add_item()' do
        it 'will add argument to items array' do
            @auction.add_item(@item1)
            
            expect(@auction.items).to eq([@item1])

            @auction.add_item(@item2)
            
            expect(@auction.items).to eq([@item1, @item2])
        end
    end

    describe '#item_names' do

    end
end