class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
        @closed = false
    end

    def add_bid(attendee, bid_amount)
        @bids[attendee] = bid_amount if @closed == false
    end

    def current_high_bid
        return 0 if @bids.count == 0
        @bids.values.max
    end

    def closed?
        @closed
    end

    def close_bidding
        @closed = true
    end
end