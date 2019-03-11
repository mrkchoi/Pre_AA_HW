require_relative '../piece.rb'
require_relative './modules/steppable.rb'

class King < Piece
  include Steppable

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return 'K'
  end
end