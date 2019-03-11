require 'byebug'
require_relative './piece.rb'

class Board
  attr_accessor :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    fill_board
  end

  def fill_board
    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if row_i >= 0 && row_i <= 1 || row_i >= 6 && row_i <= 7
          @rows[row_i][col_i] = Piece.new
        end
      end
    end
    # p @rows
  end

  # TEMPORARY BOARD RENDER
  def render_board
    @rows.each do |row|
      print "#{row}\n"
    end
  end

  # move_piece([0,0], [2,2])
  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos

    # Possible argument errors
    raise ArgumentError.new "Incorrect starting coordinates!" if !on_board?(start_pos)
    raise ArgumentError.new "No piee at starting coordinates!" if @rows[start_pos[0]][start_pos[1]].nil?
    raise ArgumentError.new "Cannot move piece to ending coordinates" if !@rows[end_pos[0]][end_pos[1]].nil?
    
    @rows[x_end][y_end], @rows[x_start][y_start] = @rows[x_start][y_start], nil
  end

  def on_board?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end


end

# b = Board.new
# b.render_board
# b.move_piece([0,0],[1,2])

