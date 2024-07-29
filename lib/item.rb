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
        largest_bid = @bids.max_by{|attendee, bid| bid}
        largest_bid.last
    end
end