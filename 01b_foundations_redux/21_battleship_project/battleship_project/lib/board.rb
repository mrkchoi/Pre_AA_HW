class Board
  def self.print_grid(arr)
    arr.each {|row| puts row.join(' ')}
  end
  
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n) {:N}}
    @size = n**2
  end

  def [](indices)
    x, y = indices[0], indices[1]
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos[0], pos[1]
    @grid[x][y] = val
  end
  
  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    cur_val = self.[](pos)

    if cur_val == :S
      self.[]=(pos, :H)
      p 'you sunk my battleship!'
      return true
    else
      self.[]=(pos, :X)
      return false
    end
  end

  def place_random_ships
    num_ships = @size / 4
    max_idx = Math.sqrt(@size)

    until self.num_ships == num_ships
      rand_x = (0...max_idx).to_a.sample
      rand_y = (0...max_idx).to_a.sample

      self.[]=([rand_x, rand_y], :S)
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |el|
        if el == :S || el == :N
          el = :N
        elsif el == :X
          el = :X
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
