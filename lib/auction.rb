class Auction
    attr_reader :items, :bidders, :bidders_info

    def initialize
        @items = []
        @bidders = []
        @bidders_info = {}
    end

    def add_item(item)
        @items << item
    end

    def item_names
        items.map { |item| item.name }
    end

    def unpopular_items
        @items.select { |item| item.bids.empty? }
    end

    def potential_revenue
        revenue = @items.map do |item| 
            item.current_high_bid
        end
        revenue.compact.sum
    end

   
end