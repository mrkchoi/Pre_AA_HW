
module Steppable
  def moves
    possible_moves = []
    move_diff.each do |x, y|
      possible_moves.concat(generate_moves(x, y))
    end
    
    possible_moves
  end

  def generate_moves(dx, dy)
    cur_x, cur_y = @pos

    cur_x += dx
    cur_y += dy

    if board.on_board?([cur_x, cur_y])
      [[cur_x, cur_y]]
    else
      []
    end
  end
end

