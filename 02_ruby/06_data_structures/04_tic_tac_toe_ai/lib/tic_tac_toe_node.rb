require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  attr_accessor :children

  MARKS = [:x, :o]

  def initialize(board = Board.new, next_mover_mark = MARKS[0], prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return board.won? && board.winner != evaluator
    elsif next_mover_mark == evaluator
      return children.all? {|child| child.losing_node?(evaluator)}
    else
      return children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator) # => :x
    if board.over?
      board.winner == evaluator  # => :x
    elsif next_mover_mark == evaluator  # => :x == :x
      children.any? {|child| child.winning_node?(evaluator)}
    else   # => :o == :x
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_tiles = get_empty_tiles
    children = []

    empty_tiles.each do |position|
      test_board = @board.dup
      test_board[position] = @next_mover_mark
      next_mark = @next_mover_mark == :x ? MARKS[1] : MARKS[0]
      next_node = TicTacToeNode.new(test_board, next_mark, position)
      children << next_node
    end
    children
  end

  def get_empty_tiles
    empty_tiles = []

    @board.rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        empty_tiles << [row_i, col_i] if @board.empty?([row_i, col_i])
      end
    end
    empty_tiles
  end
end

# t = TicTacToeNode.new
# t.children