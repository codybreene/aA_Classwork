require "byebug"
require_relative 'modules'
require 'singleton'

class Piece
  def initialize(color='', board=nil, pos=nil)
    @color = color
    @board = board
    @pos = pos
  end   

  def valid_moves
    #debugger
    case self
    when Rook, Bishop, Queen, Pawn
      possible = move_dirs.select do |move| 
        new_pos = new_pos(move)
       # grow_unblocked_moves_in_dir(move)
        @board.valid_pos?(new_pos) && @board[new_pos].color != self.color
      end
      moves = []
      possible.each do |move|
        moves += grow_unblocked_moves_in_dir(*move)
      end
    else 
      moves = move_diffs.select do |move| 
        new_pos = new_pos(move)
        @board.valid_pos?(new_pos) && @board[new_pos].color != self.color
      end

      moves.map! {|move| new_pos(move)}
    end
    moves
  end 

  def new_pos(move)
    [self.pos[0] + move[0], self.pos[1] + move[1]]
  end

  def pos=(val)
    @pos = val 
  end

  protected 
  attr_reader :pos, :color 

end

class Bishop < Piece
  include Slideable
  def symbol
    ♝ 
  end 

  protected 
  def move_dirs
    self.diagonal_dirs
  end 
end 

class Rook < Piece
  include Slideable
  def symbol
    ♜
  end 

  protected 
  def move_dirs
    self.horizontal_dirs
  end 
end 

class Queen < Piece
  include Slideable
  def symbol
    ♛
  end 

  protected 
  def move_dirs
    self.horizontal_dirs + self.diagonal_dirs
  end 
end 

class Pawn < Piece 
  def symbol
    ♟
  end 

  def move_dirs 
    forward_steps + side_attacks
  end 

  private
  def at_start_row?
    [1, 6].any? {|row| pos[0] == row} 
  end 

  def forward_dir
    if @color == :white 
      return 1 
    else 
      return -1 
    end 
  end 

  def forward_steps 
    # debugger
    if at_start_row?
      
      if forward_dir == 1
        [[2,0], [1,0]]
      else
        [[-2,0],[-1,0]]
      end
    elsif forward_dir == 1
      [1, 0]
    else 
      [-1, 0]
    end 
  end 

  def side_attacks
    poss_attacks = []
    if color == :white 
      attack_pos_1 = [pos[0] + 1, pos[1] + 1]
      attack_pos_2 = [pos[0] + 1, pos[1] - 1]
      poss_attacks << attack_pos_1 if @board[attack_pos_1].color == :black
      poss_attacks << attack_pos_2 if @board[attack_pos_2].color == :black
    else
      attack_pos_1 = [pos[0] - 1, pos[1] + 1]
      attack_pos_2 = [pos[0] - 1, pos[1] - 1]
      poss_attacks << attack_pos_1 if @board[attack_pos_1].color == :white
      poss_attacks << attack_pos_2 if @board[attack_pos_2].color == :white
    end
    poss_attacks
  end
end

class Knight < Piece
  include Steppable 
  def symbol
    ♞
  end 

  protected 
  def move_diffs
    [[1, 2],
    [1, -2], 
    [-1, 2], 
    [-1, -2], 
    [2, 1], 
    [-2, 1], 
    [2, -1], 
    [-2, -1]
  ]
  end 
end 

class King < Piece 
  include Steppable
  def symbol
    ♚
  end 

  protected 
  def move_diffs
    [ [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [-1, -1],
      [1, -1],
      [-1, 1],]
  end 
end 

class NullPiece < Piece
  include Singleton
  include Slideable
  # def initialize(color='', board, pos=[])

  # end
end

