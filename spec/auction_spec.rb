require 'spec_helper'

RSpec.describe Auction do
    before (:each) do
        @auction = Auction.new
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')
        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
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
        it 'returns an array of all item names in items array' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)

            expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
        end
    end

    describe '#unpopular_items' do
        it 'returns an array of items which have no bids' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item1.add_bid(@attendee1, 22)
            @item1.add_bid(@attendee2, 20)
            @item2.add_bid(@attendee2, 20)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq([@item3, @item5])

            @item3.add_bid(@attendee2, 15)

            expect(@auction.unpopular_items).to eq([@item5])
        end
    end

    describe 'potential_revenue' do
        it 'returns the total possible sale price of all items being sold at highest bid' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @item1.add_bid(@attendee2, 20) #LOWER PRICE DISREGARD
            @item1.add_bid(@attendee1, 22)
            @item2.add_bid(@attendee3, 1) #LOWER PRICE DISREGARD
            @item2.add_bid(@attendee2, 20)
            @item3.add_bid(@attendee3, 1) #LOWER PRICE DISREGARD
            @item3.add_bid(@attendee2, 15)
            @item4.add_bid(@attendee3, 1) #LOWER PRICE DISREGARD
            @item4.add_bid(@attendee2, 2) #LOWER PRICE DISREGARD
            @item4.add_bid(@attendee3, 50)

            expect(@auction.potential_revenue).to eq(107)
        end
    end

    describe '#bidders' do 
        it 'will return an array of bidders names' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @item1.add_bid(@attendee1, 22)
            @item2.add_bid(@attendee2, 20)
            @item3.add_bid(@attendee2, 15)
            
            expect (@auction.bidders).to eq([@attendee1, @attendee2])
            
            @item4.add_bid(@attendee3, 50)

            expect (@auction.bidders).to eq([@attendee1, @attendee2, @attendee3])
        end
    end
end