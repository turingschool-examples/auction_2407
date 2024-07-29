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
end