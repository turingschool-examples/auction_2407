class Attendee

    attr_reader :name, :budget, :bids

    def initialize(info)
        @name = info[:name]
        @budget = info[:budget].gsub(/\D/,'').to_i
        @bids = []
    end

    def add_bids(item)
       
    end
end