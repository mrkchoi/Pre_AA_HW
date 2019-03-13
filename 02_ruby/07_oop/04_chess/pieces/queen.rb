require_relative '../piece.rb'
require_relative './modules/slidable.rb'

class Queen < Piece
  include Slidable

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    linear + diagonal
  end

  def to_s
    if @color == :black
      " #{"\u265B".encode('utf-8')} "
    else
      " #{"\u2655".encode('utf-8')} "
    end
  end
end