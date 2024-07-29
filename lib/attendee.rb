class Attendee

    attr_accessor :name, :budget

    def initialize(details)
        @name = details[:name]
        @budget = details[:budget].delete('$').to_i
    end
end