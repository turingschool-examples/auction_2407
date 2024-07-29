class Attendee

    attr_reader :name, :budget

    def initialize(person_info)
        @name = person_info[:name]
        @budget = person_info[:budget]
    end
end
