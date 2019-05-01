require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(board_length)
        @player = Player.new
        @board = Board.new(board_length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        return true if self.win? || self.lose?
        return false
    end

    def turn()
        user_move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(user_move)
        @board.print
        puts "Remaining misses: #{@remaining_misses}"
    end
end
