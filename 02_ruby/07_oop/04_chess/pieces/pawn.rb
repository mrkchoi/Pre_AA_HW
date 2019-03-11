require_relative '../piece.rb'

class Pawn < Piece
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return 'P'
  end
end