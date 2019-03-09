
require 'set'
require 'byebug'

class Game
    attr_accessor :fragment, :current_player, :losses

    def initialize(*players)
        @players = players
        @live_players = players
        @current_player_idx = 0
        @current_player = @players[@current_player_idx]
        @dictionary = File.new("dictionary.txt").readlines.map(&:chomp).to_set
        @fragment = ''
        @losses = Hash.new(0)
    end

    def next_player!
        @current_player_idx = (@current_player_idx + 1) % @players.length
        @current_player = @players[@current_player_idx]
    end
    
    def take_turn(player)
        puts "Current Fragment: #{@fragment}"
        print "#{@current_player.name}, what letter would you like? "
        letter = gets.chomp
        if valid_play?(letter)
            @fragment << letter
            next_player!
        else
            puts "Not a valid letter"
            take_turn(player)
        end
    end

    def valid_play?(str)
        return false if !('a'..'z').include?(str.downcase)
        test_fragment = "#{@fragment}#{str}"
        @dictionary.any? {|word| test_fragment == word[0...test_fragment.length]}
    end

    def lost?
        @dictionary.include?(@fragment)
    end

    def play_round
        @fragment = ''
        until lost?
            take_turn(@current_player)
        end

        puts 'You Lose!'
        @losses[@players[(@current_player_idx - 1).abs]] += 1

        # display_standings
    end

    def update_players()
        @live_players = @live_players.select {|player| @losses[player] < 5}
    end

    def record(player)
        # debugger
        num_losses = @losses[player]
        if num_losses > 0
            "GHOST"[0...num_losses]
        end
    end

    def display_standings
        puts "Current Score:"
        @players.each do |player|
            puts "#{player.name}: #{record(player)}"
        end
    end
    
    def play_game
        until @live_players.length < 2
            play_round
            update_players
            display_standings
        end
    end
end

class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end
end
