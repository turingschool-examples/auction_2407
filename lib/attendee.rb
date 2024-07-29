class Attendee
    attr_reader :name

    def initialize(hash)
        @name = hash[:name]
        @budget = hash[:budget]
    end
end