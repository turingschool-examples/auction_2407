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

  def unpopular_items
    @items.find_all do |item|
     item.bids.empty?
    end
  end

  def potential_revenue
    total_revenue = @items.inject(0) do |sum, item|
      sum + item.current_high_bid
    end
    total_revenue
  end

  def bidders
    @items.flat_map { |item| item.bids.keys }
    .map(&:name)
    .uniq  
  end

  def bidder_info 
    info = {}
    
    @items.each do |item|
      item.bids.each do |attendee, _|
        if !info.key?(attendee)
          info[attendee] = {
            budget: attendee.budget,
            items: []
          }
        end
        info[attendee][:items] << item
      end
      # require 'pry'; binding.pry

    end
    info
  end
end