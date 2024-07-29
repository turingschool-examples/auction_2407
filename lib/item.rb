class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(attendee, bid_amount)
        @bids[attendee] = bid_amount
    end

    def current_high_bid
        return 0 if @bids.count == 0
        @bids.values.max
    end
end