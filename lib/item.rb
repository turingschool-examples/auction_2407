class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(attendee, bid)
        @bids[attendee] = bid
    end

    def current_high_bid
        @bids.values.max
        # bids = @bids.max_by { |attendee, bid| bid }
        # current_high_bid = bids[1]
    end
end