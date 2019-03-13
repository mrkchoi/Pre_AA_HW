require_relative '../piece.rb'
require_relative './modules/steppable.rb'

class King < Piece
  include Steppable
  DELTA = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_diff
    DELTA
  end

  def to_s
    if @color == :black
      " #{"\u265A".encode('utf-8')} "
    else
      " #{"\u2654".encode('utf-8')} "
    end
  end
end