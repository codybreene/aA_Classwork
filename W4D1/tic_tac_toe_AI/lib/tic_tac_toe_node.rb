require "byebug"
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over? 
      if board.winner != evaluator
        return true
      elsif board.winner == nil || board.winner == evaluator
        return false
      end
    end
    # return false if board.over? && (board.winner.nil? || board.winner != evaluator)
    (next_mover_mark == evaluator && self.children.all? {|child| child.losing_node?(evaluator)}) ||
    (next_mover_mark != evaluator && self.children.any? {|child| child.losing_node?(evaluator)})
  end

  def winning_node?(evaluator)
    if board.over? 
      if board.winner != evaluator
        return false
      elsif board.winner == nil || board.winner == evaluator
        return true
      end
    end

    (next_mover_mark == evaluator && self.children.any? {|child| child.winning_node?(evaluator)}) ||
    (next_mover_mark != evaluator && self.children.all? {|child| child.winning_node?(evaluator)})

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    node_children =  []
    # debugger
    (0...board.rows.length).each do |row|
      (0...board.rows.length).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          @prev_move_pos = pos
          new_mark = ((self.next_mover_mark == :x) ? :o : :x)
          node_children << TicTacToeNode.new(new_board, new_mark, pos)
        end
      end
    end
    node_children
  end
end


