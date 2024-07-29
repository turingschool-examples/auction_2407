class Item
  attr_reader :name, :bids, :close

  def initialize(name)
    @name = name
    @bids = {}
    @close = false
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    @bids.values.max
  end

  # def close_bidding
  #   @close = true
  # end
end