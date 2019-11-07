require "byebug"

module Slideable
  HORIZONTAL_DIRS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
  ]
  DIAGONAL_DIRS = [
    [1,1],
    [-1,-1],
    [1,-1],
    [-1,1],
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end 

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  private 

  def grow_unblocked_moves_in_dir(dir_y, dir_x)
    debugger
    unblocked = []
    row, col = pos  
    new_pos = [row + dir_y, col + dir_x]
    while @board.valid_pos?(new_pos) && (@board[new_pos] == NullPiece.instance || @board[new_pos].color != self.color)
      unblocked << new_pos 
      new_pos = [(new_pos[0] + dir_y), (new_pos[1] + dir_x)]
    end   
    unblocked 
  end

  def move_dirs
    raise "you forgot to write move_dirs for this piece"
  end
end 

module Steppable
  
  def moves 
    possible_moves = []
    row, col = pos  
    self.move_diffs.each do |move|
      possible_moves << [row + move[0], col + move[1]] if @board.valid_pos?(new_pos)
    end 
    possible_moves
  end 

  private 

  def move_diffs
    raise "you forgot to write move_diffs for this piece"
  end

end 













