require_relative 'cursor'
require "colorize"

class Display

  def initialize
    @cursor = Cursor.new([0,0], board)
  end

end