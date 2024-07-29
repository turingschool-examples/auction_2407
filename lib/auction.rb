class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        items.map { |item| item.name }
    end

    def unpopular_items

        unpopular_items = []
        
        # look through each item
        # if item does not have any bids, put that item in the unpopular items array
    end
end