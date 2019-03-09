require 'set'

class Game
    attr_accessor :dictionary, :fragment, :current_player

    def initialize(*players)
        @players = players
        @active_players = players
        @fragment = ''
        @dictionary = Set.new(File.new("dictionary.txt").readlines.map(&:chomp))
        @current_player_idx = 0
        @current_player = @players[@current_player_idx]
        @losses = Hash.new(0)
    end
    
    # switch current player
    def next_player!
        @current_player_idx = (@current_player_idx + 1) % @players.length
        @current_player = @active_players[@current_player_idx]
    end

    # take_turn
    def take_turn(player)
        puts "Current Fragment: #{@fragment}"
        puts "#{player.name}, What letter do you choose? "
        guess = gets.chomp

        if valid_play?(guess)
            @fragment << guess
            next_player!
        else
            puts "Not a valid guess! Try again."
            take_turn(player)
        end
    end

    # valid_play?(str)
    def valid_play?(str)
        return false if !('a'..'z').include?(str.downcase)
        test_fragment = "#{@fragment}#{str}"
        @dictionary.any? {|word| test_fragment == word[0...test_fragment.length]}
    end

    # lost?
    def lost?
        @dictionary.include?(@fragment)
    end

    def display_standings
        puts "Current standings: "
        @players.each do |player|
            puts "#{player.name}: #{record(player)}"
        end
    end

    def record(player)
        if @losses[player] > 0
            "GHOST"[0...@losses[player]]
        end
    end

    def update_players
        @active_players = @players.select {|player| @losses[player] < 5}
    end

    def play_round
        @fragment = ''
        
        until lost?
            take_turn(@current_player)
        end
        puts "---------------------------------------"
        puts "#{@players[@current_player_idx - 1].name} loses that round!"
        @losses[@players[@current_player_idx - 1]] += 1

        puts "---------------------------------------"
        display_standings
        puts "---------------------------------------"
    end

    def play_game
        until @active_players.length < 2
            play_round
            update_players
            # display_standings
        end
        puts "Game over!"
        puts "#{@players[@current_player_idx - 1].name} loses the game."
    end
end

class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end
end