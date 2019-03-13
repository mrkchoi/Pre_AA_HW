require 'byebug'
require 'colorize'
require_relative './cursor.rb'
require_relative './board.rb'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render(current_player)
    system('clear')
    print "\n#{current_player.name}'s Turn.\n\n"
    build_display_grid.each do |row|
      puts row.join('')
    end
    print "\n(Navigate using WASD or arrow keys)\n"
    if @board.in_check?(current_player.color)
      print "\n#{current_player.name} is in check!\n"
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
    if cursor.cursor_pos == [i, j] && cursor.selected
      bg = :green
    elsif cursor.cursor_pos == [i, j]
      bg = :light_yellow
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
