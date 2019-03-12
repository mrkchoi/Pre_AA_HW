require_relative '../piece.rb'
require_relative './modules/slidable.rb'

class Bishop < Piece
  include Slidable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    diagonal
  end

  def to_s
    if @color == :black
      " #{"\u265D".encode('utf-8')} "
    else
      " #{"\u2657".encode('utf-8')} "
    end
  end
end