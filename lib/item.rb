class Item

    attr_reader :bids, :name

    def initialize(name)
        @bids = {}
        @name = name
    end

    # add bid needs 2 args and adds attendee and name to bids hash
    def add_bid(attendee, amount)
        @bids[attendee] = amount
    end

    # current high bid gets max amount from @bids hash. use .max
    def current_high_bid
        @bids.values.max
    end
end