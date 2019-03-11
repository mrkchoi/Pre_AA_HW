require 'set'
require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    board = []
    (0..13).each do |cup|
      if cup != 6 && cup != 13
        board << [:stone, :stone, :stone, :stone]
      else
        board << []
      end
    end
    board
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    else
      return true
    end
  end

  def make_move(start_pos, current_player_name) # => (1, player1)
    # debugger
    # transpose start_pos for 1 - 6
    
    # start_pos -= 1 if start_pos > 0 && start_pos <= 6
    stone_count_array, @cups[start_pos] = @cups[start_pos], []
    current_pos = start_pos + 1

    # debugger
    if current_player_name == @player1 # start_pos => [0,1,2,3,4,5]
      until stone_count_array.empty?
        @cups[current_pos] << stone_count_array.shift if current_pos != 13

        current_pos == 13 ? current_pos = 0 : current_pos += 1
      end
    else  # start_pos => [7,8,9,10,11,12]
      until stone_count_array.empty?
        @cups[current_pos] << stone_count_array.shift if current_pos != 6
        
        current_pos == 13 ? current_pos = 0 : current_pos += 1
      end
    end

    render
    current_pos == 0 ? current_pos = 13 : current_pos -= 1
    next_turn(current_pos)
    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # debugger
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].count == @cups[13].count
      return :draw
    elsif @cups[6].count > @cups[13].count
      return "#{@player1}"
    else
      return "#{@player2}"
    end
  end
end

