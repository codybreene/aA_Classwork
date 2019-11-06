require 'singleton'

class Piece
  def initialize(color, symbol, board)
  end   

  def moves(piece_type)
    
  end 
end

class Bishop < Piece
  def symbol
    ♝ 
  end 

  protected 
  def move_dirs

  end 
end 

class Rook < Piece
  def symbol
    ♜
  end 

  protected 
  def move_dirs

  end 
end 

class Queen < Piece
  def symbol
    ♛
  end 

  protected 
  def move_dirs

  end 
end 

class Pawn < Piece 
  def symbol
    ♟
  end 
end 

class Knight < Piece
  def symbol
    ♞
  end 

  protected 
  def move_diffs

  end 
end 

class King < Piece 
  def symbol
    ♚
  end 

  protected 
  def move_diffs

  end 
end 

class NullPiece < Piece
  include Singleton
end

module Slideable
  HORIZONTAL_DIRS: [
    [y, x+1],
    [y, x+2], 
    [y, x+3],
    [y, x+4],
    [y, x+5],
    [y, x+6],
    [y, x+7],
    [y, x-1],
    [y, x-2],
    [y, x-3],
    [y, x-4],
    [y, x-5],
    [y, x-6],
    [y, x-7],
  ]
  DIAGONAL_DIRS: [
    [y+1, x+1],
    [y+2, x+2], 
    [y+3, x+3],
    [y+4, x+4],
    [y+5, x+5],
    [y+6, x+6],
    [y+7, x+7],
    [y-1, x-1],
    [y-2, x-2],
    [y-3, x-3],
    [y-4, x-4],
    [y-5, x-5],
    [y-6, x-6],
    [y-7, x-7],
    [y+1, x-1],
    [y+2, x-2], 
    [y+3, x-3],
    [y+4, x-4],
    [y+5, x-5],
    [y+6, x-6],
    [y+7, x-7],
    [y-1, x+1],
    [y-2, x+2],
    [y-3, x+3],
    [y-4, x+4],
    [y-5, x+5],
    [y-6, x+6],
    [y-7, x+7],
  ]

  def horizontal_dirs 

  end 

  def diagonal_dirs 

  end 

end 