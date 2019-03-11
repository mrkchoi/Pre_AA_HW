require_relative '../piece.rb'
require_relative './modules/slidable.rb'

class Queen < Piece
  include Slidable

  def initialize(board, color, pos)
    super(color, board, pos)
  end

  def to_s
    return 'Q'
  end
end