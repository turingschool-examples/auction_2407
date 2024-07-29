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
        @items.each do |item| 
            tally += item.current_highest_bid if !(item.bids.empty?)
        end
        tally
    end

    def bidders
        output = []
        @items.each do |item| 
            if !(item.bids.empty?)
                item.bids.each { |attendee, price| output << attendee.name}
            end
        end
        output.uniq
    end

    # def bidder_info
    #     output = {}
    #     bidders_list = []
    #     @items.each do |item| 
    #         if !(item.bids.empty?)
    #             item.bids.each { |attendee, price| bidders_list << attendee.name}
    #         end
    #     end
    #     bidders_list
    # end
end