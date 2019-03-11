require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1, game_over = false, seq = [])
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
  end

  def play
    print "\n\nWelcome to Simon!\n\n"
    sleep(1)
    system('clear')
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn 
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      # add_random_color
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    print "\n\nRemember the pattern!\n"
    print "\n#{@seq}\n\n> "
    sleep(2)
    system('clear')
  end

  def require_sequence
    print "\n\nEnter the pattern:\n\n\n\n> "
    input = gets.chomp.split(' ')
    @game_over = true if input != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    print "\n\nCorrect match! Great job!\n\n"
    sleep(1)
    system('clear')
  end

  def game_over_message
    print "\n\nGame over!\n\n"
  end

  def reset_game
    print "\n\nPlay again? (y/n)?\n> "
    input = gets.chomp.upcase
    if input == 'Y'
      @sequence_length = 1
      @game_over = false
      @seq = []
      play
    else
      system('clear')
      print "\n\nThanks for playing!\n\n"
      sleep(2)
      system('clear')
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end