class Auction

    attr_reader :items, :bidders

    def initialize
        @items = []
        @bidders = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        items_names = @items.map { |item| item.name}
    end

    def unpopular_items
        unpop_items = @items.find_all { |item| item.bids.empty?}
    end

    def potential_revenue
        revenue = 0
        @items.each do |item|
            revenue += item.current_high_bid
        end
        revenue
    end
end