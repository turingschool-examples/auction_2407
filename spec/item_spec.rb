require 'spec_helper'

RSpec.describe Item do
    before (:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    end

    describe '#initialize()' do
        it 'is an instance of an item' do
            expect(@item1).to be_a(Item)
        end

        it 'has a name' do
            expect(@item1.name).to eq('Chalkware Piggy Bank')
        end
        
        it 'has bids hash' do
            expect(@item1.bids).to eq({})
        end
    end

    describe '#add_bid()' do
        it 'will add a KVP to the bids hash based on argument' do
            @item1.add_bid(@attendee2, 20)
            
            expect(@item.bids).to eq({@attendee2 => 20})

            @item1.add_bid(@attendee1, 22)

            expect(@item.bids).to eq({
                                        @attendee2 => 20,
                                        @attendee1 => 22
                                    })
        end
    end
end