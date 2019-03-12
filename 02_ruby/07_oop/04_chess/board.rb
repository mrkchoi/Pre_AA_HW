require 'byebug'
require_relative './pieces.rb'
require_relative './cursor.rb'

class Board
  attr_accessor :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    fill_board
  end

  def fill_board
    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if row_i >= 2 && row_i <= 5
          @rows[row_i][col_i] = NullPiece.instance
        end
      end
    end
    fill_back_row_pieces
    fill_pawn_rows
  end

  def fill_back_row_pieces
    filled_row = []
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if row_i == 0
          piece_name = back_pieces[col_i]
          @rows[row_i][col_i] = piece_name.new(self, :black, [row_i, col_i])
        elsif row_i == 7    
          piece_name = back_pieces[col_i]
          @rows[row_i][col_i] = piece_name.new(self, :white, [row_i, col_i])
        end
      end
    end

  end

  def fill_pawn_rows
    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if row_i == 1
          @rows[row_i][col_i] = Pawn.new(self, :black, [row_i, col_i])
        elsif row_i == 6  
          @rows[row_i][col_i] = Pawn.new(self, :white, [row_i, col_i])
        end
      end
    end
  end

  # # TEMPORARY BOARD RENDER
  # def render_board
  #   @rows.each do |row|
  #     print "#{row}\n"
  #   end
  # end

  # move_piece([0,0], [2,2])
  def move_piece(start_pos, end_pos)
    x_start, y_start = start_pos
    x_end, y_end = end_pos

    # Possible argument errors
    if @rows[start_pos[0]][start_pos[1]] == NullPiece
      raise ArgumentError.new "No piece at starting coordinates!" 
      return nil
    elsif !@rows[start_pos[0]][start_pos[1]].moves.include?(end_pos)
      raise ArgumentError.new "Cannot move piece to ending coordinates" 
      # @cursor.get_input
      return nil
    end

    @rows[x_end][y_end], @rows[x_start][y_start] = @rows[x_start][y_start], NullPiece.instance
    @rows[x_end][y_end].pos = end_pos
  end

  def on_board?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col]
  end

  def checkmate?(color) # => :black
    # debugger
    king_pos = pos_of_king(color)
    # p king_pos
    return true if king_pos.nil? # && in_check?(color)
    king_piece = @rows[king_pos[0]][king_pos[1]]
    all_king_moves = king_piece.valid_moves
    
    

    all_possible_opponent_moves = []

    opposing_color = nil
    color == :black ? opposing_color = :white : opposing_color = :black 

    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if @rows[row_i][col_i] == NullPiece
          next
        elsif @rows[row_i][col_i].color == opposing_color
          all_possible_opponent_moves += @rows[row_i][col_i].moves
        end
      end
    end

    filtered_opponent_moves = filter_all_possible_moves(all_possible_opponent_moves, opposing_color)



    all_king_moves.all? do |king_move|
      opponent_can_reach_king?(filtered_opponent_moves, king_move)
    end

  end

  def in_check?(color)
    all_possible_moves = []

    opposing_color = nil
    color == :black ? opposing_color = :white : opposing_color = :black 

    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if @rows[row_i][col_i] == NullPiece
          next
        elsif @rows[row_i][col_i].color == opposing_color
          all_possible_moves += @rows[row_i][col_i].moves
        end
      end
    end

    filtered_opponent_moves = filter_all_possible_moves(all_possible_moves, opposing_color)
    king_position = pos_of_king(color)

    opponent_reaches_king = opponent_can_reach_king?(filtered_opponent_moves, king_position)

    opponent_can_reach_king?(filtered_opponent_moves, king_position)
  end

  def opponent_can_reach_king?(filtered_opponent_moves, king_position)
    filtered_opponent_moves.any? do |move|
      move == king_position
    end
  end

  def filter_all_possible_moves(moves, opposing_color)
    filtered_moves = []
    moves.each do |move|
      if @rows[move[0]][move[1]].is_a?(NullPiece) || @rows[move[0]][move[1]].color != opposing_color
        filtered_moves << move
      end
    end
    filtered_moves
  end

  def pos_of_king(color)
    king_position = nil

    @rows.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        if @rows[row_i][col_i].is_a?(King) && @rows[row_i][col_i].color == color
          king_position = [row_i, col_i]
        end
      end
    end
    king_position
  end



end

# b = Board.new
# b.fill_board
# # b.render_board
# b.pos_of_king(:black)

