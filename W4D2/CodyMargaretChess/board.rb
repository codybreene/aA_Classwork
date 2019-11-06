require_relative "piece"

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)} # set nil to NullPiece
    [0,1,6,7].each do |i|
      @rows[i].map! {|space| Piece.new}
    end
  end

  def move_piece(start_pos, end_pos)
    raise "There's no piece there!" if self[start_pos] == NullPiece.instance
    raise "You can't move there" unless valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def valid_pos?(pos)
    row, col = pos
    return false unless row.between?(0,7) && col.between?(0,7)
    # add logic to check for own piece is pos
    true
  end

  def [](pos)
    row, col = pos 
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos 
    @rows[row][col] = piece 
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)
  end

  def pieces
  end

  def dup
    duped_rows = rows.map(&:dup)
    self.class.new(duped_rows)
  end

  private
  attr_reader :rows 

end