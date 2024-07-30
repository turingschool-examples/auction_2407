class auction

    def initialze
        @item = {}
        @attendee = Attendee.new
        @bids = 
        @auction = []
    end

    def item.hash {
        item1: 50
        item2: 100
        item3: 150
    }
    end

    def item.has_bid?
        if @item >= @bid
            false
        else true
        end
    end

    def item.add(item)
        @item => item
    end

    def item.bid(item)
        @item => bid
    end

    def auction.potential_revenue
        item.map {|item| (item * growth_factor).round}
    end
end