
require_relative './towers.rb'
# require 'byebug'

class Game
  attr_reader :towers, :num_towers

  def initialize
    @towers = nil
    @num_towers = nil
    @move_count = 0
  end

  def play
    create_towers

    until win?
      render_towers
      make_move    
    end

    print "\nCongrats! You win!\n"
  end

  def create_towers
    system('clear')
    print "Please enter number of towers:\n> "
    @num_towers = gets.chomp.to_i
    create_towers unless @num_towers.between?(2, 10)

    @towers = Towers.new(num_towers)
  end

  def render_towers
    @towers.render_towers
  end

  def make_move
    print "Move count: #{@move_count}"
    print "\nMake a move (e.g. 12):\n> "
    # debugger
    player_move = gets.chomp.chars.map {|el| el.to_i - 1}
    from_pos, to_pos = player_move

    make_move if from_pos.nil? || to_pos.nil? ||  !from_pos.between?(0, 2) || !to_pos.between?(0, 2)

    if @towers.valid_move?(player_move) 
      @move_count += 1
      @towers.make_move(player_move)
    else
      print "Invalid move! Try again.\n\n"
    end
  end

  def win?
    @towers.towers.last.tower.count == @num_towers
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end