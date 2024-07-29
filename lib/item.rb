class Item
  attr_reader :name, :bids, :biddable

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @biddable = true
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.values.max
  end
end