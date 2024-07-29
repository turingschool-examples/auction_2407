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
end