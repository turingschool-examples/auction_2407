class Auction

    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        names_list = []
        @items.find_all do |item|
            names_list << item.name
        end
        names_list
    end
end
