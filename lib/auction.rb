class Auction
    attr_reader :items, :item_names, :bidders, :bidder_info

    def initialize
        @items = []
        @item_names = []
        @bidders = []
        @bidder_info = {}
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

    def add_bidder(attendee)
        add_bidder_info(attendee)
        @bidders << attendee.name
    end

    def add_bidder_info(attendee)
        @bidder_info[attendee] = {budget: attendee.budget, items: []}
    end

    def bidder_info
        @bidder_info.keys.each do |attendee|
            all_bids = []
            all_bids = @items.select{|item| item.bids.include?(attendee)}
            @bidder_info[attendee][:items] = all_bids if all_bids.count > 0
        end
        @bidder_info
    end
end