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
    system('clear')
    print "\n"
    @towers.each_with_index do |tower, i|
      print "Tower #{i + 1}: #{tower.tower}\n"
    end
    print "\n"
  end

  def valid_move?(move)
    start_tower = move[0]
    end_tower = move[1]

    return false if start_tower.nil? || end_tower.nil?

    start_value = @towers[start_tower]
    end_value = @towers[end_tower]

    if start_value.peek.nil?
      return false
    elsif end_value.peek.nil?
      return true
    elsif start_value.peek > end_value.peek
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