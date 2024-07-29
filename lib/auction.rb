class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name}
  end

  def unpopular_items
    @items.select {|item| item.bids.empty?}
  end

  def potential_revenue
    @items.sum { |item| item.current_high_bid.to_i}
  end

  def bidders
    all_bidder_names = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        all_bidder_names << attendee.name
      end
    end
    unique_bidder_names = all_bidder_names.uniq
    unique_bidder_names
  end
end