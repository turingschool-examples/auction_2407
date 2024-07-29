class Item
  attr_reader :name,
              :bids,
              :stop_bidding

  def initialize(name)
    @name = name
    @bids = {}
    @stop_bidding = false
  end

  def add_bid(attendee, bid)
   if stop_bidding == false
    @bids[attendee] = bid
    end
  end

  def current_high_bid
    return 0 if @bids == {}
    @bids.values.max
  end

  def close_bidding
    @stop_bidding = true
  end
end