

class KnightPathFinder

    def self.valid_moves(pos)
        moves = []
        [-1, 1,-3, 3].each do |x|
            [-1, 1,-3, 3].each do |y|
                moves << [x,y] if x != y && x != -y
            end
        end
        moves.map {|change| [(pos[0] + change[0]), (pos[1] + change[1])]}
    end

    def initialize(start)
        @start = start
        @considered_positions = start

    end

    def new_move_positions(pos)
        self.valid_moves(pos)
    end

end