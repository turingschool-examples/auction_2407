class Attendee
    attr_reader :name, :budget, :items

    def initialize(attributes)
        @name = attributes[:name]
        @budget = attributes[:budget]
        @items = []
    end

    def bid(item)
        @items << item
    end
end