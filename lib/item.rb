class Item
    attr_reader :name, :bids

    def initialize(name, bid = {})
        @name = name
        @bids = bid
    end

    def add_bid(attendee, bid)
        @bids[attendee] = bid
    end
end