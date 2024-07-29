class Item

    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = Hash.new
    end

    def add_bid(attendee, bid)
        @bids[attendee] = bid
    end

    def current_high_bid
        max_bid = @bids.max_by { |attendee, bid| bid}
        max_bid.last
    end
end