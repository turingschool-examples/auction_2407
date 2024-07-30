require './lib/attendee'

Respec.describe 'Attendee' do
    before(:each) do
        Attendee.new = ({name: 'Megan' name: 'Bob' name: 'Mike'})
        Budget.new = ({budget: '$50' budget: '$75' budget: '$100'})
    end

    it 'has a budget' do
      execpt(@attendee.budget). to be(50)
    end

    describe 'Item has a bid' do 
        it 'Item has a bid on it' do
            exepct(@item.attendee). to be({item:})
        end
    end
        
    describe 'item bid hash' do
        it 'has a bid' do
            expect {(item1: 50, item2: 50, item3: 100)}
        end
    end

    describe 'unpopular item' do
        it 'it is an unpolar item with price'
            execpt {[unpopular_item1: 45]}. to be ({unpopular_item: })
        end
    end

    descirbe 'Auctions potential revenue' do
        it 'has potential revenue' do
            expect(auction.potential_revenue). to eq(87)
        end
    end
end

#  auction.unpopular_items
