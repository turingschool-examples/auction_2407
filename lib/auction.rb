class Auction 

attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def items_names
    @items.map do |item|
      item.name
    end
  end

  def current_high_bid
    @bids.values.max || 0
  end

  def unpopular_items
    @items.find_all do |item|
     item.bids.empty?
    end
  end
end