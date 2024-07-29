class Item

    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = Hash.new(0)
    end

    def add_bid(attendee, bid)
        @bids[attendee] = bid
    end

    def current_high_bid
        return 0 if @bids.empty?
        max_bid = @bids.max_by { |attendee, bid| bid}
        max_bid.last
    end

end