require_relative '../piece.rb'
require 'byebug'

class Pawn < Piece
  attr_reader :color

  VALID_DIFF_LINEAR_BLACK = [[1, 0], [2, 0]]
  VALID_DIFF_DIAG_BLACK = [[1, -1], [1, 1]]
  VALID_DIFF_LINEAR_WHITE = [[-1, 0], [-2, 0]]
  VALID_DIFF_DIAG_WHITE = [[-1, -1], [-1, 1]]

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def moves
    start_x, start_y = @pos
    current_valid_moves = []

    # VALID MOVES FOR BLACK PAWN
    if @color == :black && @pos[0] == 1 && @pos[1] > 0 && @board.rows[start_x + 1][start_y - 1].color == :white && @board.rows[start_x + 1][start_y + 1].color == :white
      current_valid_moves += VALID_DIFF_LINEAR_BLACK
      current_valid_moves += VALID_DIFF_DIAG_BLACK
    elsif @color == :black && @pos[0] == 1 &&  @pos[1] > 0 && @board.rows[start_x + 1][start_y - 1].color == :white
      current_valid_moves += VALID_DIFF_LINEAR_BLACK
      current_valid_moves += [VALID_DIFF_DIAG_BLACK[0]]
    elsif @color == :black && @pos[0] == 1 &&  @pos[1] < 7 && @board.rows[start_x + 1][start_y + 1].color == :white
      current_valid_moves += VALID_DIFF_LINEAR_BLACK
      current_valid_moves += [VALID_DIFF_DIAG_BLACK[1]]
    elsif @color == :black && @pos[0] == 1
      current_valid_moves += VALID_DIFF_LINEAR_BLACK
    elsif @color == :black && @pos[1] > 0 && @pos[1] < 7 && @board.rows[start_x + 1][start_y - 1].color == :white && @board.rows[start_x + 1][start_y + 1].color == :white
      # debugger
      current_valid_moves += [VALID_DIFF_LINEAR_BLACK[0]]
      current_valid_moves += VALID_DIFF_DIAG_BLACK
    elsif @color == :black && @pos[1] > 0 && @board.rows[start_x + 1][start_y - 1].color == :white
      # debugger
      current_valid_moves += [VALID_DIFF_LINEAR_BLACK[0]]
      current_valid_moves += [VALID_DIFF_DIAG_BLACK[0]]
    elsif @color == :black && @pos[1] < 7 && @board.rows[start_x + 1][start_y + 1].color == :white
      current_valid_moves += [VALID_DIFF_LINEAR_BLACK[0]]
      current_valid_moves += [VALID_DIFF_DIAG_BLACK[1]]
    elsif @color == :black
      current_valid_moves += [VALID_DIFF_LINEAR_BLACK[0]]
    end

    # VALID MOVES FOR WHITE PAWN
    if @color == :white && @pos[0] == 6 && @pos[1] > 0 && @pos[1] < 7 &&@board.rows[start_x - 1][start_y - 1].color == :black && @board.rows[start_x - 1][start_y + 1].color == :black
      current_valid_moves += VALID_DIFF_LINEAR_WHITE
      current_valid_moves += VALID_DIFF_DIAG_WHITE
    elsif @color == :white && @pos[0] == 6 && @pos[1] > 0 && @board.rows[start_x - 1][start_y - 1].color == :black
      current_valid_moves += VALID_DIFF_LINEAR_WHITE
      current_valid_moves += [VALID_DIFF_DIAG_WHITE[0]]
    elsif @color == :white && @pos[0] == 6 && @pos[1] < 7 && @board.rows[start_x - 1][start_y + 1].color == :black
      current_valid_moves += VALID_DIFF_LINEAR_WHITE
      current_valid_moves += [VALID_DIFF_DIAG_WHITE[1]]
    elsif @color == :white && @pos[0] == 6
      current_valid_moves += VALID_DIFF_LINEAR_WHITE
    elsif @color == :white && @pos[1] > 0 && @pos[1] < 7 && @board.rows[start_x - 1][start_y - 1].color == :black && @board.rows[start_x - 1][start_y + 1].color == :black
      current_valid_moves += [VALID_DIFF_LINEAR_WHITE[0]]
      current_valid_moves += VALID_DIFF_DIAG_WHITE
    elsif @color == :white && @pos[1] > 0 && @board.rows[start_x - 1][start_y - 1].color == :black
      current_valid_moves += [VALID_DIFF_LINEAR_WHITE[0]]
      current_valid_moves += [VALID_DIFF_DIAG_WHITE[0]]
    elsif @color == :white && @pos[1] < 7 && @board.rows[start_x - 1][start_y + 1].color == :black
      current_valid_moves += [VALID_DIFF_LINEAR_WHITE[0]]
      current_valid_moves += [VALID_DIFF_DIAG_WHITE[1]]
    elsif @color == :white
      current_valid_moves += [VALID_DIFF_LINEAR_WHITE[0]]
    end
    # debugger
    generate_moves(current_valid_moves)
    # p generate_moves(current_valid_moves)
  end

  def generate_moves(valid_moves) [[1, 0], [2, 0]]
    cur_x, cur_y = @pos
    valid_moves.map do |move|
      [move[0] + cur_x, move[1] + cur_y]
    end
  end

  def to_s
    if @color == :black
      " #{"\u265F".encode('utf-8')} "
    else
      " #{"\u2659".encode('utf-8')} "
    end
  end
end