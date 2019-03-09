require 'set'

class Game
    def initialize(*players)
        @players = players
        @active_players = players
        @current_player_idx = 0
        @current_player = @players[@current_player_idx]
        @fragment = ''
        @dictionary = Set.new(File.new('./dictionary.txt').readlines.map(&:chomp))
        @losses = Hash.new(0)
    end

    def next_player!
        @current_player_idx = (@current_player_idx + 1) % @players.length
        @current_player = @active_players[@current_player_idx]
    end

    def take_turn(player)
        puts "Current player: #{@current_player.name}"
        puts "\n"
        puts "Current fragment: #{@fragment}"
        puts "#{@current_player.name}, guess your letter..."
        letter = gets.chomp
        puts "\n\n\n"

        if valid_play?(letter)
            @fragment << letter
            next_player!
        else
            puts "***************************"
            puts "Please enter a valid letter!"
            puts "***************************"
            take_turn(player)
        end
    end

    def valid_play?(str)
        letter_match = ('a'..'z').include?(str)
        guess_fragment = "#{@fragment}#{str}"
        @dictionary.any? {|word| guess_fragment == word[0...guess_fragment.length]}
    end

    def loss?
        @dictionary.include?(@fragment)
    end

    def update_players
        @active_players = @players.select {|player| @losses[player] < 5}
    end

    def record(player)
        if @losses[player] > 0
            "GHOST"[0...(@losses[player])]
        end
    end

    def display_scores
        puts "Current standings: "
        @players.each do |player|
            puts "#{player.name}: #{record(player)}"
        end
    end

    def play_round
        @fragment = ''
        until loss?
            take_turn(@current_player)
        end

        puts "***************************"
        puts "#{@players[@current_player_idx - 1].name} lost the round!"
        @losses[@players[@current_player_idx - 1]] += 1
        puts "***************************"

        display_scores
    end

    def play_game
        until @active_players.length < 2
            play_round
            update_players
        end

        puts "***************************"
        puts "Game over!"
        puts "#{@players[@current_player_idx - 1].name} loses the game!"
        puts "***************************"
    end


end


class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end
end