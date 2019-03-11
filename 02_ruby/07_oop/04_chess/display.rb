require 'byebug'
require 'colorize'
require_relative './cursor.rb'
require_relative './board.rb'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts "Navigate using WASD or arrow keys\n"
    build_display_grid.each do |row|
      puts row.join(' ')
    end
  end

  def build_display_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color = set_color(i, j)
      piece.to_s.colorize(color)
    end
  end

  def set_color(i, j)
    if cursor.cursor_pos == [i, j]
      bg = :green
    elsif (i.even? && j.odd?) || (i.odd? && j.even?)
      bg = :light_blue
    else
      bg = :white
    end
    {background: bg}
  end

  def test_cursor
    while true
      cursor.get_input
      render
    end
  end
end

d = Display.new(Board.new)
d.test_cursor