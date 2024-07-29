class Item
    attr_reader :name, :bids

    def initialize(name, bid = {})
        @name = name
        @bids = bid
    end

    def add_bid(attendee, bid)
        @bids[attendee] = bid
    end

    def current_highest_bid
        @bids.values.max
    end

    def close_bidding
        @bids.freeze
    end
end