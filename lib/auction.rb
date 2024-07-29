class Auction
    attr_reader :items, :item_names

    def initialize
        @items = []
        @item_names = []
    end

    def add_item(item)
        @items << item
        @item_names << item.name
    end

    def unpopular_items
        unpop_items = @items.find_all do |item|
            item.bids.count == 0
        end
        unpop_items
    end

    def potential_revenue
        potential_rev = 0
        @items.each do |item|
            potential_rev += item.current_high_bid
        end
        potential_rev
    end
end