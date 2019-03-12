require 'byebug'
require_relative '../piece.rb'
require_relative './modules/slidable.rb'
require_relative '../board.rb'

class Rook < Piece
  include Slidable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    linear
  end

  def to_s
    if @color == :black
      # debugger
      " #{"\u265C".encode('utf-8')} "
    else
      " #{"\u2656".encode('utf-8')} "
    end
  end
end

# r = Rook.new(Board.new, :black, [5,0])
# p r.moves