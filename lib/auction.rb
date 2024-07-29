class Auction

    attr_reader :items, :bidders, :bidder_info

    def initialize
        @items = []
        @bidders = []
        @bidder_info = Hash.new
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

    def add_bidder(attendee)
        @bidders << attendee.name
        @bidder_info[attendee] = { budget: attendee.budget, items: []}
    end

    def update_bidder_info_items
        @bidder_info.each do |attendee, info|
            attendee_bids = @items.find_all do |item|
                item.bids.keys.include?(attendee)
            end
            info[:items] = attendee_bids
        end
    end

    def close_auction
        auction = Hash.new{}
        
        @items.each do |item|
            if item.bids.empty?
                auction[item] = 'Not Sold'
                next
            end
            bids_sorted = item.bids.sort_by { |attendee, bid| -bid}
            bids_sorted.each do |attendee, bid|
                if @bidder_info[attendee][:budget] >= bid
                    item.close_bidding
                    auction[item] = attendee
                    @bidder_info[attendee][:budget] = @bidder_info[attendee][:budget] - bid
                    break
                end
            end
            auction[item] = 'Not Sold'
        end
        puts auction
        auction
    end

end