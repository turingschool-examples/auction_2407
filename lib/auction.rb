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
   @items.select do |item|
    item.bids.count == 0
   end
  end

  def potential_revenue
   @items.sum do |item|
    item.current_high_bid
   end
  end

  def bidders
   @items.flat_map do |item|
    item.bids.keys.map do |attendee|
      attendee.name
    end
   end
  end

  def bidder_info
    bidders = Hash.new {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if bidders[attendee].nil?
        bidders[attendee] = {}
        bidders[attendee][:budget] = attendee.budget
        bidders[attendee][:items] = []
        end
        bidders[attendee][:items] << item
      end
    end
    bidders
  end
end