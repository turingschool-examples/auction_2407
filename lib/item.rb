class Item
  attr_reader :name, :bids, :biddable

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @biddable = true
  end

  def add_bid(attendee, bid)
    if @biddable == true
    @bids[attendee] = bid
    else
      p "Bidding is closed for this item"
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @biddable = false
  end
end