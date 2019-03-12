require 'byebug'
require_relative './board.rb'
require_relative './display.rb'
require_relative './board.rb'
require_relative './player.rb'

class Chess
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    until @board.checkmate?(:black) || @board.checkmate?(:white)
      # print "#{@current_player.name}'s turn!'"
      # render board
      @display.render(@current_player.name)
      # debugger
      # read cursor input for current player
      # until @display.cursor.successful_play
        # debugger
        @display.cursor.get_input(@current_player.color)
      # end
      
      # if move is check, warn current player and let them go again
      # otherwise, if move is valid, make move & switch players
      if @display.cursor.successful_play 
        switch_player
      end
    end

    if @board.checkmate?(:black)
      print "\n#{@player2.name} wins!\n"
    else
      print "\n#{@player1.name} wins!\n"
    end
  end

  def switch_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    # debugger
  end

  def win?
    
  end




end



if __FILE__ == $PROGRAM_NAME
  chess = Chess.new(Player.new('Player1', :black), Player.new('Player2', :white))
  chess.play
end
