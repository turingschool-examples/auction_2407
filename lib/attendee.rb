class Attendee
    attr_reader :name, :budget

    def initialize(people)
        @name = people[:name]
        @budget = people[:budget]
    end
end