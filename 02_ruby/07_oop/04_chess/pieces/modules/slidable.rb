
module Slidable
  LINEAR_DIFF = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  DIAGONAL_DIFF = [[-1, -1], [1, -1], [-1, 1], [1, 1]]

  def linear
    LINEAR_DIFF
  end

  def diagonal
    DIAGONAL_DIFF
  end

  def moves
    possible_moves = []
    move_dir.each do |x, y|
      possible_moves.concat(generate_moves(x, y))
    end
    possible_moves
  end

  def generate_moves(dx, dy)
    cur_x, cur_y = pos
    possible_moves = []

    loop do 
      cur_x += dx
      cur_y += dy
      pos = [cur_x, cur_y]

      break if !board.on_board?(pos) || @board.rows[cur_x][cur_y].color == @color
      possible_moves << pos

      current_color = @color
      opposite_color = nil
      current_color == :black ? opposite_color = :white : opposite_color = :black
      break if @board.rows[cur_x][cur_y].color == opposite_color
    end

    possible_moves
  end
end