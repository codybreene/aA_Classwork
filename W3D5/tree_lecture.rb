class Node
    attr_reader :value, :children

    def initialize(value, children)
        @value = value
        @children = children
    end
end
