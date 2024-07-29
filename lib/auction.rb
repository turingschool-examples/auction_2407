class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        @items.map {|item| item.name}
    end

    def unpopular_items
        @items.select {|item| item.bids.empty?}
    end
    
    def potential_revenue
        tally = 0
        items.each {|item| tally += item.current_highest_bid}
        tally
    end
end