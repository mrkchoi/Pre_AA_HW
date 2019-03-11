require_relative '../piece.rb'
require_relative './modules/slidable.rb'

class Bishop < Piece
  include Slidable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return 'B'
  end
end