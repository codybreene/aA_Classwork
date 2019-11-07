require_relative "piece"
require_relative "modules"

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
    (0..7).each {|i| @rows[1][i] = Pawn.new(:white, self, [1, i])}
    (0..7).each {|i| @rows[6][i] = Pawn.new(:black, self, [6, i])}
    [0,7].each {|i| @rows[0][i] = Rook.new(:white, self, [0, i])}
    [0,7].each {|i| @rows[7][i] = Rook.new(:black, self, [7, i])}
    [1,6].each {|i| @rows[0][i] = Knight.new(:white, self, [0, i])}
    [1,6].each {|i| @rows[7][i] = Knight.new(:black, self, [7, i])}
    [2,5].each {|i| @rows[0][i] = Bishop.new(:white, self, [0, i])}
    [2,5].each {|i| @rows[7][i] = Bishop.new(:black, self, [7, i])}
    @rows[0][3] = Queen.new(:white, self, [0, 3])
    @rows[7][3] = Queen.new(:black, self, [7, 3])
    @rows[0][4] = King.new(:white, self, [0, 4])
    @rows[7][4] = King.new(:black, self, [7, 4])
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

  def to_s
    
  end

  def []=(pos, piece)
    row, col = pos 
    @rows[row][col] = piece 
  end

  def add_piece(piece, pos)
    self[pos] = piece 
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