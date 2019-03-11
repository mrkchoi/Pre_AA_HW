require_relative '../piece.rb'
require_relative './modules/slidable.rb'

class Rook < Piece
  include Slidable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return 'R'
  end
end