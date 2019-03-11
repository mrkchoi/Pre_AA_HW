require_relative '../piece.rb'

class NullPiece < Piece
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return '0'
  end
end