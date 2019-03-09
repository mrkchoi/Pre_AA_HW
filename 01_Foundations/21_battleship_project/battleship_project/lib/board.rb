class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end
    end

    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count {|el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        total_ships = @size / 4

        while self.num_ships < total_ships
            # Randomly change values to :S
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row, rand_col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N
                else
                    el
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end

