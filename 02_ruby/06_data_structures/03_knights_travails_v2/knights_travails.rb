require_relative './poly_tree_node.rb'
require 'byebug'

class KnightPathFinder

  DELTAS = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [2, -1],
    [2, 1],
    [1, -2],
    [1, 2],
  ]

  def self.valid_moves(pos)
    possible_moves(pos).select {|coords| on_board?(coords)}
  end

  def initialize(root_position)
    @root_position = root_position
    @checked_positions = [@root_position]
  end

  def new_move_positions(pos)
    new_positions = (KnightPathFinder.valid_moves(pos)) - @checked_positions
    @checked_positions += new_positions
    new_positions
  end

  def build_move_tree
    root_node = PolyTreeNode.new(@root_position)
    root_position = root_node.value
    queue = [root_node]

    until queue.empty?
      current_node = queue.shift
      possible_moves_for_current = new_move_positions(current_node.value)
      children = []

      possible_moves_for_current.each do |move|
        new_child = PolyTreeNode.new(move)
        children << new_child
        new_child.parent = current_node
        current_node.add_child(new_child)

      end
      queue += children
    end

    root_node
  end

  def find_path(target_pos)
    target_node = build_move_tree.bfs(target_pos)
    trace_path_back(target_node)
  end

  def trace_path_back(target_node)
    path_to_target = [target_node.value]

    until target_node.parent.nil?
      path_to_target << target_node.parent.value
      target_node = target_node.parent
    end
    
    path_to_target.reverse
  end
  
  private
  
  def self.possible_moves(pos)
    x, y = pos
    DELTAS.map do |coords|
      cur_x, cur_y = coords
      [x - cur_x, y - cur_y]
    end
  end

  def self.on_board?(coord)
    coord.all? {|el| el.between?(0,7)}
  end

  
end

k = KnightPathFinder.new([0,0])
p k.find_path([1,3])