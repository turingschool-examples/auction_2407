require 'spec_helper'

RSpec.describe auction do
    before (:each) do
        @auction = Auction.new
    end

    describe '#initialize()' do
        it 'is an instance of an Auction' do
            expect(@auction).to be_a(Auction)
        end

        it 'has an items array initialized as empty' do
            expect(@auction.items).to eq([])
        end
    end

    describe '#add_item()' do

    end

    describe '#item_names' do

    end
end