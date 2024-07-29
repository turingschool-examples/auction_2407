class Auction

    attr_reader :items

    def initialize
        @items = []
      
    end

    def add_item(item)
        @items << item
    end

    def item_names(item)
        names = []
        @items.each do |item| 
            names << item.name
        end
        names   
    end

    def unpopular_items
        @items.select { |item| item.bids.empty? }
    end

    def potential_revenue
        @items.sum { |item| item.current_high_bid.to_i }
    end

    def bidders
        bidder_list = []
        @items.each do |item|
            item.bids.each_key do |attendee|
                unless bidder_list.include?(attendee)
                    bidder_list << attendee
                end
            end
        end
        bidder_list.map {|attendee| attendee.name}
    end

    def bidder_info
        info = {}
        @items.each do |item|
          item.bids.each do |attendee, amount|
            info[attendee] ||= { budget: attendee.budget, items: [] }
            info[attendee][:items] << item
          end
        end
        info
    end
 
end