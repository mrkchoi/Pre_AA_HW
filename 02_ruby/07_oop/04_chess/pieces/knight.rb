require_relative '../piece.rb'
require_relative './modules/steppable.rb'

class Knight < Piece
  include Steppable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    return 'k'
  end
end