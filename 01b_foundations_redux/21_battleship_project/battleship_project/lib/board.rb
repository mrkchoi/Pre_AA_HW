class Board
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
end
