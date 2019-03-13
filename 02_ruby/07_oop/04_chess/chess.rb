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
      @display.render(@current_player)
      @display.cursor.get_input(@current_player.color)

      switch_player if @display.cursor.successful_play
    end

    if @board.checkmate?(:black)
      print "\n#{@player2.name} wins!\n"
    else
      print "\n#{@player1.name} wins!\n"
    end
  end

  def switch_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
end



if __FILE__ == $PROGRAM_NAME
  chess = Chess.new(Player.new('Player1', :black), Player.new('Player2', :white))
  chess.play
end
