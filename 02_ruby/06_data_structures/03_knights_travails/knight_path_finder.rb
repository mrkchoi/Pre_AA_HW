
require 'byebug'
require_relative './poly_node_tree.rb'

class KnightPathFinder

  # Note: Chess board (8x8), index from 0 - 7
  def self.valid_moves(pos) # => [0,0]
    valid_moves = []



  end

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @root_node = PolyTreeNode.new(@starting_pos)
    @considered_positions = [@starting_pos]
    # self.build_move_tree
  end

  def build_move_tree
  end

  
end

