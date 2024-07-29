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
        names_list = []
        @items.find_all do |item|
            names_list << item.name
        end
        names_list
    end

    def unpopular_items
        @items.find_all do |item|
           item.bids.empty?
        end
    end

    def potential_revenue
        largest_bids_total = []
        @items.find_all do |item|
            largest_bids_total.push(item.current_high_bid)
        end
        largest_bids_total.sum
    end

    def admit_attendees(attendee)
        @bidders << attendee.name
    end
end
