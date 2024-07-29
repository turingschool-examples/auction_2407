class Item

    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = Hash.new(0)
        @closed = false
    end

    def add_bid(attendee, bid)
        return false if @closed
        @bids[attendee] = bid
    end

    def close_bidding
        @closed = true
    end

    def current_high_bid
        return 0 if @bids.empty?
        max_bid = @bids.max_by { |attendee, bid| bid}
        max_bid.last
    end

end