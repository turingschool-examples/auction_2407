class Auction 
    attr_reader :items

    def initialize(items)
        @items = items
    end

    auction.items = []

    auction.items << auction.add_item(item1), auction.add_item(item2)

    p auction.items
end