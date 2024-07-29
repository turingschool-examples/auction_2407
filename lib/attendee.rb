class Attendee
    attr_reader :name, :budget, :items

    def initialize(attributes)
        @name = attributes[:name]
        @budget = attributes[:budget].delete("$").to_i
        @items = []
    end

    def bid(item, bid)
        if bid <= @budget
            item.add_bid(self, bid)
            @items << item
        else
            puts "Not enough money to bid."
        end
      
    end
end