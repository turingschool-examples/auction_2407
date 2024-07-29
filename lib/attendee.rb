class Attendee
    attr_reader :name, :budget

    def initialize(hash)
        @name = hash[:name]
        @budget = budget_convert(hash[:budget])
    end

    def budget_convert(string)
        string.slice!('$')
        string.to_i
    end
end