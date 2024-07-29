class Auction

    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

# safe nav operator(&) for arg or nil error?
    def item_names
        @items.map(&:name)
    end

# - `unpopular_items` are those items which have no bids. if not in @bids or no add_bid(item). empty?
    def unpopular_items
        unwanted = []
        @items.each do |item|
            if item.bids.empty?
                unwanted << item
            end
        end
        unwanted
    end
# - `potential_revenue` is the total possible sale price of the items (the items highest bid)
    def potential_revenue
        total_revenue = 0
        @items.each do |item|
            total_revenue += item.current_high_bid.to_i
        end
        total_revenue
    end
# map over all items to bids to name. map over names and return new array. map returns 2 pairs of arrays. flatten??
    def bidders
        @items.flat_map do |item|
            item.bids.keys.map(&:name)
        end
    end
# hash of k attendee and subhash k/v budget/items. iterate over items into info...?
    def bidder_info
    end

end
