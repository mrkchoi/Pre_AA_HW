require_relative './display.rb'

class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def make_move
    @cursor.get_input
  end
end