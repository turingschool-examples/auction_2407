class Item
    attr_reader :name, :bids

    def initialize(name, bid = {})
        @name = name
        @bids = bid
    end
end