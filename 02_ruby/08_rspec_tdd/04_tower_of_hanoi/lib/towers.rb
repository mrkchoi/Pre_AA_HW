require_relative './stack.rb'

class Towers
  attr_accessor :towers

  def initialize(num_towers)
    @towers = Array.new(3)
    @num_towers = num_towers
    create_towers(@num_towers)
  end

  def create_towers(num_towers)
    towers = (1..num_towers).to_a.reverse
    @towers[0] = Stack.new(towers)
    @towers[1] = Stack.new([])
    @towers[2] = Stack.new([])
  end

  def render_towers
    @towers.each_with_index do |tower, i|
      print "Tower #{i + 1}: #{tower.tower}\n"
    end
  end

  def valid_move?(move)
    start_tower = (move[0])
    end_tower = (move[1])

    start_value = @towers[start_tower].peek
    end_value = @towers[end_tower].peek

    if start_value.nil? 
      return false
    elsif end_value.nil?
      return true
    elsif start_value > end_value
      return false
    else
      return true
    end
  end

  def make_move(player_move)
    start_tower_idx, end_tower_idx = player_move
    @towers[end_tower_idx].push(@towers[start_tower_idx].pop)
  end
end