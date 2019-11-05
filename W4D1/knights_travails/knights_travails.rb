require "byebug"
require_relative "00_tree_node copy.rb"

class KnightPathFinder

    attr_reader :root

    def self.valid_moves(pos)
        moves = []
        [-1, 1,-2, 2].each do |x|
            [-1, 1,-2, 2].each do |y|
                moves << [x,y] if x != y && x != -y
            end
        end
        all = moves.map {|change| [(pos[0] + change[0]), (pos[1] + change[1])]}
        all.select do |move|
            move[0] >= -8 && move[0] <= 8 && move[1] >= -8 && move[1] <= 8
        end
    end

    def initialize(start)
        @start = start
        @considered_positions = [start]
        @root = PolyTreeNode.new(@start) #need @root to access tree
        self.build_move_tree

    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos).select do |move|
            !@considered_positions.include?(move)
        end
        @considered_positions.concat(possible_moves)
        possible_moves
    end
    
    def build_move_tree

        que = [@root]

        until que.empty?
            current_root = que.pop
            new_move_positions(current_root.value).each do |move|
                child = PolyTreeNode.new(move)
                current_root.add_child(child)
                # child.parent = current_root #dont need this step, add_child already sets this
                que.unshift(child)
            end   
        end
        # root
    end

    def find_path(end_pos)
        # debugger
        found_node = @root.bfs(end_pos)
        trace_path_back(found_node)
    end

    def trace_path_back(end_node)

        path = []
        # debugger
        until end_node.parent.nil?
            path.unshift(end_node.value)
            end_node = end_node.parent
        end
        # [] + @start + path # this works -- why???
        # @start += path # this doesn't work
        path.unshift(@start)

    end


end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


