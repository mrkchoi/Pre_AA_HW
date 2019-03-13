require "io/console"
require_relative './board.rb'

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board, :selected, :successful_play

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
    @selected_positions = []
    @successful_play = false
  end

  def get_input(color)
    @successful_play = false
    key = KEYMAP[read_char]
    handle_key(key, color)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  # key => :up, :down...
  def handle_key(key, color)
    case key
    when :return, :space
      toggle_selected
      select_positions_for_move(@cursor_pos, color)
    when :left, :right, :up, :down
      diff = MOVES[key]
      update_pos(diff)
      nil
    when :ctrl_c
      Process.exit(0)
    else
    end
  end

  def select_positions_for_move(pos, color)
    if @board[pos].is_a?(NullPiece) && @selected_positions.empty?
      get_input(color)
    elsif @selected_positions.count == 0 && @board[pos].color != color
      get_input(color)
    elsif @selected_positions.count == 0
      @selected_positions << pos
    elsif @selected_positions.count == 1
      @selected_positions << pos
      if @board.rows[@selected_positions[1][0]][@selected_positions[1][1]].color == color
        @selected_positions = []
        get_input(color)
        return nil
      else
        successful_move = @board.move_piece(@selected_positions[0], @selected_positions[1])
        if successful_move
          @successful_play = true
        end
        @selected_positions = []
        
      end
    end
  end

  def toggle_selected
    @selected = !@selected
  end

  def update_pos(diff)
    start_x, start_y = @cursor_pos
    diff_x, diff_y = diff
    new_pos = [start_x + diff_x, start_y + diff_y]

    if board.on_board?(new_pos)
      toggle_selected if @selected
      @cursor_pos = new_pos
    end
  end
end