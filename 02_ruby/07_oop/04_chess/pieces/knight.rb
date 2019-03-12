require_relative '../piece.rb'
require_relative './modules/steppable.rb'

class Knight < Piece
  include Steppable
  DELTA = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_diff
    DELTA
  end

  def to_s
    if @color == :black
      " #{"\u265E".encode('utf-8')} "
    else
      " #{"\u2658".encode('utf-8')} "
    end
  end
end