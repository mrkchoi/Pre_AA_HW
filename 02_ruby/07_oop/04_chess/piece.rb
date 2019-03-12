class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
  end

  def to_s
    symbol
  end

  def valid_moves
    moves.select do |pos|
      @board.on_board?(pos) && (@board.rows[pos[0]][pos[1]] || @board.rows[pos[0]][pos[1]].color != color)
    end
  end

  # def inspect
  #   {'pos' => @pos}
  # end
end