
require 'byebug'
require_relative './poly_node_tree.rb'

class KnightPathFinder
  ################################
  # CLASS METHODS
  ################################
  def self.valid_moves(pos) # => [0,0]
    valid_moves = []
    x, y = pos

    ((x - 2)..(x + 2)).each do |new_x|
      if x - new_x == 2
        valid_moves << [new_x, y - 1]
        valid_moves << [new_x, y + 1]
      elsif x - new_x == 1
        valid_moves << [new_x, y + 2]
        valid_moves << [new_x, y - 2]
      elsif new_x - x == 1
        valid_moves << [new_x, y + 2]
        valid_moves << [new_x, y - 2]
      elsif new_x - x == 2
        valid_moves << [new_x, y - 1]
        valid_moves << [new_x, y + 1]
      end
    end

    valid_moves.reject! do |move|
      x, y = move
      x < 0 || x > 7 || y < 0 || y > 7
    end
    valid_moves
  end

  ################################
  # INITIALIZE
  ################################  
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @root_node = PolyTreeNode.new(@starting_pos)
    @considered_positions = [@starting_pos]
    # self.build_move_tree
  end

  ################################
  # INSTANCE METHODS
  ################################
  def build_move_tree
  end

  def new_move_positions(pos)
    unfiltered_moves = KnightPathFinder.valid_moves(pos)

    unfiltered_moves.each {|move| @considered_positions << move unless @considered_positions.include?(move)}
    
    @considered_positions
  end



  
end

# k = KnightPathFinder.new([2,2])
k = KnightPathFinder.new([0,0])

p k.new_move_positions([0,0])