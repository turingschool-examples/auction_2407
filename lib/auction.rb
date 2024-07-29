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
      # require 'pry'; binding.pry
      item.current_high_bid
    end
    bid_list.compact.sum
  end
end