class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    name_list = @items.map do |item|
      item.name
    end
    name_list
  end

  def unpopular_items
    no_bids = @items.find_all do |item|
      item.bids.values.empty?
    end
    no_bids
  end

  def potential_revenue
    bid_list = @items.map do |item|
      item.current_high_bid
    end
    bid_list.compact.sum
  end

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.each do |bid|
        bidder_names << bid[0].name
      end
    end
    bidder_names
  end

  def bidder_info
    info = Hash.new(0)
    @items.each do |item|
      item.bids.each do |bid|
        info[bid[0].name] = bid[0].budget
        #assign this hash value to the key of the attendee
      end
    end
  end
end