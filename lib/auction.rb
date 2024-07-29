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
end